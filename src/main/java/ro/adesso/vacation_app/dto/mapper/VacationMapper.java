package ro.adesso.vacation_app.dto.mapper;


import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import ro.adesso.vacation_app.dto.VacationRequestDTO;
import ro.adesso.vacation_app.model.VacationRequest;

@Mapper(componentModel = "spring")
public interface VacationMapper {

    @Mapping(target = "user.vacationRequests", ignore = true)
    VacationRequestDTO toDTO(VacationRequest vacation);

    VacationRequest toEntity(VacationRequestDTO vacationDTO);
}
