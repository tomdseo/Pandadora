package com.tommy.pandadora.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tommy.pandadora.repositories.PandadoraRepository;
import com.tommy.pandadora.models.PandadoraModel;

@Service
public class PandadoraService {
	@Autowired
	private PandadoraRepository pandadoraRepository;

	// returns all the languages
    public List<PandadoraModel> allSongs() {
        return (List<PandadoraModel>) pandadoraRepository.findAll();
    }
    
    //adds a song
    public PandadoraModel addSong(PandadoraModel s) {
        return pandadoraRepository.save(s);
    }
    
    //retrieves a song
    public List<PandadoraModel> findSong(String artist) {
        List<PandadoraModel> listSong = pandadoraRepository.findByArtistContaining(artist);
        if(listSong.size() > 0) {
        return listSong;
        }
        return null;
    }
    
    //deletes a song
    public void deleteSong(Long id) {
    	pandadoraRepository.deleteById(id);
    }
    
    //shows a song
    public Optional<PandadoraModel> showSong(Long id) {
    	return pandadoraRepository.findById(id);
    }
    
    //finds top ten songs
    public List<PandadoraModel> findTopTen() {
    	return pandadoraRepository.findByOrderById();
    }
    
}
