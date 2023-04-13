package mycar.data;

import org.springframework.data.jpa.repository.JpaRepository;

public interface MycarDaoInter extends JpaRepository<MycarDto, Long> {

}
