package ro.adesso.vacation_app.graphql.input;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class UserInput {

    private String username;
    private String email;
    private String firstName;
    private String lastName;
    private Long reportsToId;

    public UserInput(String username, String email, String firstName, String lastName, Long reportsToId) {
        this.username = username;
        this.email = email;
        this.firstName = firstName;
        this.lastName = lastName;
        this.reportsToId = reportsToId;
    }

}
