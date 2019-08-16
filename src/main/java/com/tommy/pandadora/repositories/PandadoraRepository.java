package com.tommy.pandadora.repositories;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;

import com.tommy.pandadora.models.PandadoraModel;

public interface PandadoraRepository extends CrudRepository<PandadoraModel, Long>{
	List<PandadoraModel> findByArtistContaining(String artist);
	Optional<PandadoraModel> findById(String id); //Have to use Optional rather than List because findById() only applies to Optional
	List<PandadoraModel> deleteById(String id);
	List<PandadoraModel> findByOrderByRatingDesc();
}
