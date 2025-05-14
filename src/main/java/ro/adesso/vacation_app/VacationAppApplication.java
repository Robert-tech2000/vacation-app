package ro.adesso.vacation_app;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cache.annotation.EnableCaching;

@SpringBootApplication
@EnableCaching
public class VacationAppApplication {

	public static void main(String[] args) {
		SpringApplication.run(VacationAppApplication.class, args);
	}

}
