/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo.entidades;

import java.io.Serializable;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;
import javax.persistence.EntityNotFoundException;
import javax.persistence.EntityTransaction;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import javax.transaction.UserTransaction;
import modelo.entidades.exceptions.NonexistentEntityException;
import modelo.entidades.exceptions.RollbackFailureException;

/**
 *
 * @author Ramon
 */
public class ContieneJpaController implements Serializable {

    public ContieneJpaController(EntityManagerFactory emf) {
        
        this.emf = emf;
    }
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(Contiene contiene) throws RollbackFailureException, Exception {
        EntityManager em = null;
        EntityTransaction etx = null;
        try {
            
            em = getEntityManager();
            etx = em.getTransaction();
            etx.begin();
            em.persist(contiene);
            etx.commit();
        } catch (Exception ex) {
            try {
                etx.rollback();
            } catch (Exception re) {
                throw new RollbackFailureException("An error occurred attempting to roll back the transaction.", re);
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(Contiene contiene) throws NonexistentEntityException, RollbackFailureException, Exception {
        EntityManager em = null;
        EntityTransaction etx = null;
        try {
            em = getEntityManager();
            etx = em.getTransaction();
            etx.begin();
            contiene = em.merge(contiene);
            etx.commit();
        } catch (Exception ex) {
            try {
                etx.rollback();
            } catch (Exception re) {
                throw new RollbackFailureException("An error occurred attempting to roll back the transaction.", re);
            }
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                Long id = contiene.getId();
                if (findContiene(id) == null) {
                    throw new NonexistentEntityException("The contiene with id " + id + " no longer exists.");
                }
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void destroy(Long id) throws NonexistentEntityException, RollbackFailureException, Exception {
        EntityManager em = null;
        EntityTransaction etx = null;
        try {
            
            em = getEntityManager();
            etx = em.getTransaction();
            etx.begin();
            Contiene contiene;
            try {
                contiene = em.getReference(Contiene.class, id);
                contiene.getId();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The contiene with id " + id + " no longer exists.", enfe);
            }
            em.remove(contiene);
            etx.commit();
        } catch (Exception ex) {
            try {
                etx.rollback();
            } catch (Exception re) {
                throw new RollbackFailureException("An error occurred attempting to roll back the transaction.", re);
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<Contiene> findContieneEntities() {
        return findContieneEntities(true, -1, -1);
    }

    public List<Contiene> findContieneEntities(int maxResults, int firstResult) {
        return findContieneEntities(false, maxResults, firstResult);
    }

    private List<Contiene> findContieneEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(Contiene.class));
            Query q = em.createQuery(cq);
            if (!all) {
                q.setMaxResults(maxResults);
                q.setFirstResult(firstResult);
            }
            return q.getResultList();
        } finally {
            em.close();
        }
    }

    public Contiene findContiene(Long id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Contiene.class, id);
        } finally {
            em.close();
        }
    }

    public int getContieneCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<Contiene> rt = cq.from(Contiene.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
