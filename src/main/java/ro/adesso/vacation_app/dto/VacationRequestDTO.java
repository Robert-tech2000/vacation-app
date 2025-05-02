package ro.adesso.vacation_app.dto;

import lombok.Getter;
import lombok.Setter;
import ro.adesso.vacation_app.model.VacationRequestStatus;
import ro.adesso.vacation_app.model.VacationRequestType;
import ro.adesso.vacation_app.util.AbstractEntity;

import java.time.LocalDate;

@Getter
@Setter
public class VacationRequestDTO extends AbstractEntity {

    private LocalDate startDate;
    private LocalDate endDate;
    private Long duration;
    private String description;
    private VacationRequestType type;
    private VacationRequestStatus status;
    private boolean withPay;

    private UserDTO user;
}
