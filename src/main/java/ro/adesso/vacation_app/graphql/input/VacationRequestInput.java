package ro.adesso.vacation_app.graphql.input;

import lombok.Getter;
import lombok.Setter;
import ro.adesso.vacation_app.dto.mapper.UserMapper;
import ro.adesso.vacation_app.model.VacationRequestStatus;
import ro.adesso.vacation_app.model.VacationRequestType;

import java.time.LocalDate;

@Setter
@Getter
public class VacationRequestInput {

    private LocalDate startDate;
    private LocalDate endDate;
    private String description;
    private boolean withPay;
    private VacationRequestType type;
    private VacationRequestStatus status;
    private Long userId;

    private UserMapper userMapper;

    public VacationRequestInput(LocalDate startDate, LocalDate endDate, String description, VacationRequestType type, VacationRequestStatus status, boolean withPay, Long userId) {
        this.startDate = startDate;
        this.endDate = endDate;
        this.description = description;
        this.type = type;
        this.status = status;
        this.withPay = withPay;
        this.userId = userId;
    }

}
