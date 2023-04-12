package boot.mvc.start;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan({"boot.test","boot.hello"})
public class SpringbootEx1Application {

	public static void main(String[] args) {
		SpringApplication.run(SpringbootEx1Application.class, args);
	}

}
