package ro.adesso.vacation_app.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import ro.adesso.vacation_app.model.VacationRequest;
import ro.adesso.vacation_app.model.VacationRequestStatus;

import java.util.List;

@Repository
public interface VacationRequestRepository extends JpaRepository<VacationRequest, Long> {
    List<VacationRequest> findByUserId(Long userId);

    List<VacationRequest> findByStatus(VacationRequestStatus status);

    List<VacationRequest> findByUserIdAndStatus(Long userId, VacationRequestStatus status);
}
