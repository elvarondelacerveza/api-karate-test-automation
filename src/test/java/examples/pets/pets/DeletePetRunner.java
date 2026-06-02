package examples.pets.pets;

import com.intuit.karate.junit5.Karate;

/**
 * @Author Tony - Parra
 */
public class DeletePetRunner {
    @Karate.Test
    Karate testDeletePets(){
        return Karate.run("deletePets").relativeTo(getClass());
    }
}
