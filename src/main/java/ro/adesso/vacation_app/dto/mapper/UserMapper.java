package ro.adesso.vacation_app.dto.mapper;


import org.mapstruct.Mapper;
import ro.adesso.vacation_app.dto.UserDTO;
import ro.adesso.vacation_app.model.User;

@Mapper(componentModel = "spring")
public interface UserMapper {

    UserDTO toDTO(User user);

    User toEntity(UserDTO userDTO);
}
