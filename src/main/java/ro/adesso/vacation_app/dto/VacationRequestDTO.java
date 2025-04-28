package ro.adesso.vacation_app.dto;

import lombok.Getter;
import lombok.Setter;
import ro.adesso.vacation_app.model.User;
import ro.adesso.vacation_app.model.VacationRequestStatus;
import ro.adesso.vacation_app.model.VacationRequestType;
import ro.adesso.vacation_app.util.AbstractEntity;

import java.util.Date;

@Getter
@Setter
public class VacationRequestDTO extends AbstractEntity {

    private Date startDate;
    private Date endDate;
    private Integer duration;
    private String description;
    private VacationRequestType type;
    private VacationRequestStatus status;
    private boolean withPay;

    private User user;
}
