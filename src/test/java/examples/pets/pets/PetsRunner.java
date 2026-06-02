package examples.pets.pets;

import com.intuit.karate.junit5.Karate;

/**
 * @Author Tony - Parra
 */
public class PetsRunner {
    @Karate.Test
    Karate testPets(){
        return Karate.run("pets").relativeTo(getClass());
    }
}
