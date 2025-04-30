package ro.adesso.vacation_app.dto.mapper;


import org.mapstruct.Mapper;
import ro.adesso.vacation_app.dto.VacationRequestDTO;
import ro.adesso.vacation_app.model.VacationRequest;

@Mapper(componentModel = "spring")
public interface VacationMapper {

    VacationRequestDTO toDTO(VacationRequest vacation);

    VacationRequest toEntity(VacationRequestDTO vacationDTO);
}
