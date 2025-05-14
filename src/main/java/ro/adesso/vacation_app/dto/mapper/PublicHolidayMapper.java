package ro.adesso.vacation_app.dto.mapper;


import org.mapstruct.Mapper;
import ro.adesso.vacation_app.dto.PublicHolidayDT0;
import ro.adesso.vacation_app.model.PublicHoliday;

@Mapper(componentModel = "spring")
public interface PublicHolidayMapper {

    PublicHolidayDT0 toDTO(PublicHoliday publicHoliday);

    PublicHoliday toEntity(PublicHolidayDT0 publicHolidayDT0);
}
