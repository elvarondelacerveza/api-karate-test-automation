package examples.pets.pets;

import com.intuit.karate.junit5.Karate;

/**
 * @Author Tony - Parra
 */
public class SearchPetRunner {
    @Karate.Test
    Karate testSearchPets(){
        return Karate.run("searchPets").relativeTo(getClass());
    }
}
