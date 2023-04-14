package quiz.jshop.data;

import org.springframework.data.jpa.repository.JpaRepository;

public interface JpaDaoInter extends JpaRepository<JpaShopDto, Integer> {

}
