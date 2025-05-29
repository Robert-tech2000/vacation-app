package ro.adesso.vacation_app.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.*;
import ro.adesso.vacation_app.util.AbstractEntity;

import java.util.List;

@Entity
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class User extends AbstractEntity {

    @Column(unique = true, nullable = false)
    private String username;
    private String firstName;
    private String lastName;
    private String email;
    private int allotedVacationDays;
    private boolean isArchived;

    @ManyToOne
    private User reportsTo;

    @OneToMany(mappedBy = "user", fetch = FetchType.EAGER)
    @JsonIgnore
    private List<VacationRequest> vacationRequests;

}
