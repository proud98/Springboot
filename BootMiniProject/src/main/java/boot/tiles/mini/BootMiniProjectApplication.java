package boot.tiles.mini;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan({"boot.data.*","boot.tiles.mini"}) //메인패키지도 인식 시켜주기..
@MapperScan({"boot.data.mapper"})
public class BootMiniProjectApplication {

	public static void main(String[] args) {
		SpringApplication.run(BootMiniProjectApplication.class, args);
	}

}
