/**
 * @authror Sébastien Gonzalez
 * @author Younes Rouabhia
 */
package triangle.src;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.NoSuchFileException;
import java.nio.file.Path;
import java.nio.file.Paths;

public class Triangle {
	private float a;
	private float b;
	private float c;

	public Triangle(float a, float b, float c) {
		this.a = a;
		this.b = b;
		this.c = c;
	}

	public Triangle() {
		a = b = c = 0;
	}

	public float getA() {
		return a;
	}

	public void setA(float a) {
		this.a = a;
	}

	public float getB() {
		return b;
	}

	public void setB(float b) {
		this.b = b;
	}

	public float getC() {
		return c;
	}

	public void setC(float c) {
		this.c = c;
	}

	public double[] readData(String cheminFichier) throws NoSuchFileException {
		double tab[] = { -1, -1, -1 };
		double errorTab[] = { -1, -1, -1 };
		Path source = Paths.get(cheminFichier);

		// Ouverture en lecture :
		try (BufferedReader reader = Files.newBufferedReader(source, StandardCharsets.UTF_8)) {
			String line;

			try {
				line = reader.readLine();
			} catch (Exception e) {
				return errorTab;
			}

			try {
				String lineSplit[] = line.split(" ");
				for(int i=0; i<3; i++)
					tab[i] = Double.parseDouble(lineSplit[i]);
			} catch (NumberFormatException | ArrayIndexOutOfBoundsException | NullPointerException e) {
				return errorTab;

			}
			
			if(reader.readLine() != null) return errorTab;
		} catch (NoSuchFileException e) {
			throw new NoSuchFileException(cheminFichier);
		} catch (IOException e1) {
			e1.printStackTrace();
			return errorTab;
		}

		return tab;
	}

	public int typeTriangle(double a, double b, double c) {
		if (a < 0 || b < 0 || c < 0)
			return -1;
		if (c >= a + b || b >= a + c || a >= b + c)
			return -1; // si ce n'est pas un triangle
		if (a == b && a == c)
			return 3;
		if (a == b || a == c || b == c)
			return 2;
		return 1;
	}

}
