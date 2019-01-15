package org.spring.util;

import java.io.IOException;
import java.util.ArrayList;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.spring.memberDTO.CrawlerDTO;
import org.springframework.stereotype.Repository;

@Repository
public class Crawler {
	@SuppressWarnings("unchecked")
	public ArrayList<ArrayList<CrawlerDTO>> crawler() throws IOException {
	System.out.println("crawler");
		
		String url="https://comic.naver.com/webtoon/weekday.nhn";
		Document doc=Jsoup.connect(url).get();
		
		Elements els=doc.select(".daily_all li"); //��� ���� ����
		
		ArrayList<CrawlerDTO> dayList=new ArrayList<>();	//���Ϻ� ���
		ArrayList<ArrayList<CrawlerDTO>> allList=new ArrayList<>(); //��ü ���
		
		String check="mon"; //���� üũ
		String checked="";  //���� ������ ����
		for(Element el : els) {
			
			CrawlerDTO dto=new CrawlerDTO();
			
			dto.setSrc(el.select("img").first().attr("src"));
			dto.setHref("https://comic.naver.com"+el.select("a").first().attr("href"));
			dto.setTitle(el.select("img").first().attr("title"));
			
			checked=dto.getHref().substring(dto.getHref().length()-3); // ddd ����
			
			if(!check.equals(checked)) {
				allList.add((ArrayList<CrawlerDTO>) dayList.clone()); //���� ����
				dayList.clear();
				check=checked;
			}
			dayList.add(dto);
		}
		allList.add((ArrayList<CrawlerDTO>) dayList.clone());
	
	return allList;
	}
}
