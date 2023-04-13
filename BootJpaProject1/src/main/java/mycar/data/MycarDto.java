package mycar.data;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;

import lombok.Data;

@Entity //자동으로 mysql에 테이블 mycar라는 테이블이 만들어지고 변수가 변경되는 경우는 자동수정
@Table(name="mycar") //mycar 라는 테이블을 생성 
@Data
public class MycarDto {
	
	@Id //각 엔터티를 구별 할 수 있는 식별아이디를 갖도록 설계(시퀀스 역할)
	@GeneratedValue(strategy = GenerationType.AUTO) 
	private long num; //자동증가하는 num은 long 으로 많이 함, id와 GeneratedValue 주는건 기본임
	
	@Column(name="carname")
	private String carname;
	
	@Column //이름이 같으면 name="" 생략 가능
	private int carprice;
	
	@Column
	private String carcolor;
	
	@Column
	private String carguip;
	
	@CreationTimestamp //엔터티가 생성되는 시점의 시간을 등록(now()와 같은 역할)
	@Column(updatable = false) //수정 할 때 이 컬럼은 수정하지 않겠다는 것
	private Timestamp guipday; //이건 추가 된 컬럼

}
