package com.tommy.pandadora.controllers;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import javax.validation.Valid;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.tommy.pandadora.models.PandadoraModel;
import com.tommy.pandadora.services.PandadoraService;

@Controller
public class PandadoraController {
	@Autowired
	private PandadoraService pandadoraService;
	
	//Index Page
	@RequestMapping("/")
	public String index() {
		return "/pandadora/index.jsp";
	}
	
	//Dashboard Page (Show All Songs Page)
	@RequestMapping("/dashboard") 
	public String dashboard(@ModelAttribute("song") PandadoraModel song, BindingResult result, Model model) {
		List<PandadoraModel> songs = pandadoraService.allSongs();
		model.addAttribute("songs", songs);
		return "/pandadora/dashboard.jsp";
	}
	
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	//Add Song Page
	@RequestMapping("/songs/new")
	public String addSongPage(@ModelAttribute("song") PandadoraModel song, BindingResult result) {
		return "/pandadora/add-song.jsp";
	}
	
	//Add Song Form
	@RequestMapping(value="/add_song", method=RequestMethod.POST)
	public String addSongAction(@Valid @ModelAttribute("song") PandadoraModel song, BindingResult result) {
		if (result.hasErrors()) {
	      return "/pandadora/add-song.jsp";
	  } else {
	      pandadoraService.addSong(song);
	      return "redirect:/songs/new/confirmation";
	      }
	  }
	
	//Add Song Confirmation
	@RequestMapping("/songs/new/confirmation")
	public String addSongPageConfirmation() {
		return "/pandadora/add-song-confirmation.jsp";
	}
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
  //Delete Song 
  @RequestMapping(value="/songs/delete/{id}", method=RequestMethod.GET)
  public String deleteSong(@PathVariable("id") Long id) {
  	pandadoraService.deleteSong(id);
  	return "redirect:/dashboard";
  }
  
  //Show Specific Song
  @RequestMapping(value="/songs/{id}", method=RequestMethod.GET)
  public String showSong(@PathVariable("id") Long id, Model model) {
	  Optional<PandadoraModel> song = pandadoraService.showSong(id);
	  model.addAttribute("song", song.get());
	  return "pandadora/show-song.jsp";
  }
	
  //Look Up Specific Song by Artist 
  @RequestMapping(value="/search", method=RequestMethod.POST)
  public String showSongByArtist(@RequestParam("artist") String artist, Model model) {
	  if(pandadoraService.findSong(artist) != null) {
		  List<PandadoraModel> songs = pandadoraService.findSong(artist);
		  model.addAttribute("songs", songs);
		  return "pandadora/search-by-artist.jsp";
	  }
  	  return "pandadora/search-not-found.jsp";
  }
	
	//Top Ten Songs Page
	@RequestMapping("/search/topTen")
	public String topTenPage(Model model) {
		if(pandadoraService.findTopTen().size() > 0) {
			List<PandadoraModel> topSongs = pandadoraService.findTopTen();
			model.addAttribute("songs", topSongs);
			return "pandadora/top-ten-songs.jsp";
		}
		return "top-ten-not-found.jsp";
	}
	
	
}
