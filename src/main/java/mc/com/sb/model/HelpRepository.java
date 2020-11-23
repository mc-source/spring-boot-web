package mc.com.sb.model;

import java.util.Arrays;
import java.util.List;

public class HelpRepository {

	public static List<Help> links = Arrays.asList(
			new Help("Home(Spring-Boot)","https://spring.io/projects/spring-boot"),
			new Help("Examples(MKyong)","https://mkyong.com/spring-boot/"),
			new Help("Tutorial(Baeldung)","https://www.baeldung.com/spring-boot"),
			new Help("Tutorial(pdf)","http://www.lsis.org/elmouelhia/courses/java/spring/coursSpringBootFondamentaux.pdf")
			);
}
