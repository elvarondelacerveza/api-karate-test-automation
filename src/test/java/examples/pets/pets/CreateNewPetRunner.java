package examples.pets.pets;

import com.intuit.karate.junit5.Karate;

/**
 * @Author Tony - Parra
 */
public class CreateNewPetRunner {
    @Karate.Test
    Karate testCreatePets(){
        return Karate.run("createNewPets").relativeTo(getClass());
    }
}
