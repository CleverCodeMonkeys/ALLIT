package com.kh.ccms.intro.model.Factory;

public class MainItemFactory implements MainFactory
{
	@Override
	public String createItem(String name) {
		String result = null;
		
		switch(name){
			case FactoryMenu.TOP10:     result = "Intro.Top10List";   break;
			case FactoryMenu.ITMOIVE: result = "Intro.MovieList";   break;
			case FactoryMenu.BANNER : result = "Intro.BannerList";  break;
			case FactoryMenu.ALGORITHM: result= "Intro.AlgorithmList"; break;
		}
		
		return result;
	}

}
