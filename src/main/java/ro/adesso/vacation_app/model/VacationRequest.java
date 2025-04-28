package ro.adesso.vacation_app.model;

import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.ManyToOne;
import lombok.Getter;
import lombok.Setter;
import ro.adesso.vacation_app.util.AbstractEntity;

import java.util.Date;

@Entity
@Getter
@Setter
public class VacationRequest extends AbstractEntity {

    private Date startDate;
    private Date endDate;
    private Integer duration;
    private String description;

    @Enumerated(EnumType.STRING)
    private VacationRequestType type;

    @Enumerated(EnumType.STRING)
    private VacationRequestStatus status;

    private boolean withPay;

    @ManyToOne
    private User user;
}
