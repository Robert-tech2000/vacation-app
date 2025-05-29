package ro.adesso.vacation_app.graphql.resolver;

import org.springframework.graphql.data.method.annotation.Argument;
import org.springframework.graphql.data.method.annotation.MutationMapping;
import org.springframework.graphql.data.method.annotation.QueryMapping;
import org.springframework.stereotype.Controller;
import ro.adesso.vacation_app.dto.UserDTO;
import ro.adesso.vacation_app.graphql.input.UserInput;
import ro.adesso.vacation_app.service.UserService;

import java.util.List;

@Controller
public class UserGraphQLController {

    private final UserService userService;

    public UserGraphQLController(UserService userService) {
        this.userService = userService;
    }

    @QueryMapping
    public UserDTO getUser(@Argument Long id) {
        return userService.getUser(id);
    }

    @QueryMapping
    public List<UserDTO> getAllUsers() {
        return userService.getAllUsers();
    }

    @MutationMapping
    public UserDTO createUser(@Argument UserInput input) {
        UserDTO dto = new UserDTO();
        dto.setUsername(input.getUsername());
        dto.setEmail(input.getEmail());
        dto.setFirstName(input.getFirstName());
        dto.setLastName(input.getLastName());
        dto.setArchived(false);

        if (input.getReportsToId() != null) {
            UserDTO reportsTo = new UserDTO();
            reportsTo.setId(input.getReportsToId());
            dto.setReportsTo(reportsTo);
        }

        return userService.createUser(dto);
    }

    @MutationMapping
    public boolean archiveUser(@Argument Long id) {
        return userService.archiveUser(id);
    }
}