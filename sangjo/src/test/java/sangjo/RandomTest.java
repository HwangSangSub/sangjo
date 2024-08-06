package sangjo;

import java.util.Iterator;
import java.util.Random;

public class RandomTest {

	public static void main(String[] args) {
		Random random = new Random();

		int a;
		for (int i = 0; i < 1000; i++) {
			a = random.nextInt(8999999)+1000000;
			System.out.println(a);
		}
	}

}
