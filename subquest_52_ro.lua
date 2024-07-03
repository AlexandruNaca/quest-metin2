---------------------------------------------------------------------------------------
-------------------			”84 Misiuni in romana oficiale” pack.	-------------------
-------------------			 Munca realizata de Pablo Escopar.		-------------------
-------------------				Skype: mesesan_paul_calin			-------------------
---------------------------------------------------------------------------------------
quest subquest_28 begin
	state start begin
		when login or levelup with pc.level >=52   and pc.level <= 54 begin
			set_state(information)
		end
	end

	state information begin
		when letter begin
			local v=find_npc_by_vnum(20017)
			if 0==v then
			else
				target.vid("__TARGET__", v, "Du-te la Yu-Hwan")
			end
		end

		when __TARGET__.target.click or
			20017.chat."Instrumentul lui Yu-Hwan" begin
			target.delete("__TARGET__")
			say_title("Yu-hwan:")
			say_verde("")
			say_verde("Instrumentul meu nu mai scoate sunetele")
			say_verde("ca inainte... sunt foarte trist, doar")
			say_verde("prietenul meu fierarul m-ar putea ajuta.")
			say_verde("Du-te pana la el si spune-i problema mea.")
			set_state(to_weaponshop)
		end
	end

	state to_weaponshop begin
		when letter begin
                send_letter("~Lv 52 - Du-te la fierar")
                q.set_icon("scroll_open_golden.tga")
			q.start()
			
			local v=find_npc_by_vnum(20016)
			if 0==v then
			else
				target.vid("__TARGET__", v, "Du-te la Fierar")
			end

		end
		when info or button begin
			say_title("Du-te la Fierar")
			say_verde("")
			say_verde("Du-te la Fierar si vorbeste cu el.")
		end

		
		when __TARGET__.target.click or
			20016.chat."Yu-hwan este trist" begin
			target.delete("__TARGET__")
			say_title("Blacksmith:")
			say_verde("")
			say_verde("Sunetele instrumentului sau nu sunt cum")
			say_verde("erau deoarece trebuie sa mai schimbe si")
			say_verde("coarda. Canta la el zi si noapte...")
			set_state(back_to_yuhwan)

		end
	end
	state back_to_yuhwan begin
		when letter begin
                send_letter("~Lv 52 - Inapoi la Yu-Hwan")
                q.set_icon("scroll_open_golden.tga")
			q.start()
		
			local v=find_npc_by_vnum(20017)
			if 0==v then
			else
				target.vid("__TARGET__", v, "Inapoi la Yu-Hwan")
			end


		end
		
		when info or  button begin
			say_title("Inapoi la Yu-Hwan")
			say_verde("")
			say_verde("Du-te la Yu-Hwan si spune-i noutatiile.")
		end
		
		when __TARGET__.target.click or
			20017.chat."Corzile sunt problema" begin
			target.delete("__TARGET__")
			say_title("Yu-Hwan:")
			say_verde("")
			say_verde("Deci corzile sunt problema instrumentului.")
			say_verde("As avea nevoie de o panza de paianjen dar")
			say_verde("nu am acum la mine, imi faci tu rost ?")
            local s=select("Sigur","Nu am timp")
            if 2==s then
                    say_title("Yu-Hwan:")
                    say_verde("")
                    say_verde("Vrei sa abandonezi misiunea?")
                    say_verde("")
                    local a=select("Da, vreau","Inchide")
                    if  2==a then
                            say_title("Yu-Hwan:")
                            say_verde("")
                            say_verde("Oh, ce bine ca te-ai razgandit.")
                            return
                    end
                    say_title("Yu-Hwan:")
                    say_verde("")
                    say_verde("Atunci nu mai avem ce discuta!")
                    set_state(__GIVEUP__)
                    return
            end
            say_title("Yu-Hwan:")
            say_verde("")
            say_verde("Du-te si fa rost de panza de paianjen.")
			set_state(find_spider)
			
		end

	end

		
		
		
	
	state find_spider begin
		when letter begin
                send_letter("~Lv 52 - Panza de paianjen")
                q.set_icon("scroll_open_golden.tga")
			q.start()
			
			if pc.count_item(30056)>0 then	
				local v=find_npc_by_vnum(20017)
				if 0!= v then
					target.vid("__TARGET__",v,"Du-te la Yu-Hwan")
				end 
			end

		end
		when info or  button begin
			if pc.count_item(30056)>0 then	
				say_title("Panza de paianjen")
				say_verde("")
				say_verde("Ai obtinut panza de painjen, du-te si")
				say_verde("vorbeste acum cu Yu-Hwan.")
				return
			end
	
			say_title("Panza de paianjen")
			say_verde("")
			say_verde("Obtine panza de painjen de la paianjen")
			say_verde("gheara toxic rau pentru Yu-Hwan.")
		end

		when 2054.kill  begin
			
			local s = number(1, 100)
			if s <= 5 and pc.count_item(30056)==0  then
				pc.give_item2(30056, 1)

			end
		end

		when __TARGET__.target.click or 
			20017.chat."Am panza de paianjen" begin
			target.delete("__TARGET__")
			if  pc.count_item("30056")>=1 then 
				target.delete("__TARGET__")
				say_title("Yu-hwan:")
				say_verde("")
				say_verde("Iti multumesc, acum sunt fericit.")
				say_verde("")
                say_reward("Recompensa:")
                say_reward("10.000.000 Puncte de experienta")
                say_reward("420.000 Yang")
				pc.removeitem(30056,1)
                pc.give_exp2(10000000)
                pc.change_money(420000)
                set_quest_state("levelup","run")
				clear_letter()
				set_state(__COMPLETE__)
				return
			else
				say_title("Yu-hwan:")
				say_verde("")
				say_verde("Nu ai panza, mai incerci sa faci rost?")
                local s=select("Sigur","Nu am timp")
                if 2==s then
                        say_title("Yu-Hwan:")
                        say_verde("")
                        say_verde("Vrei sa abandonezi misiunea?")
                        say_verde("")
                        local a=select("Da, vreau","Inchide")
                        if  2==a then
                                say_title("Yu-Hwan:")
                                say_verde("")
                                say_verde("Oh, ce bine ca te-ai razgandit.")
                                return
                        end
                        say_title("Yu-Hwan:")
                        say_verde("")
                        say_verde("Atunci nu mai avem ce discuta!")
                        set_state(__GIVEUP__)
                        return
                end
                say_title("Yu-Hwan:")
                say_verde("")
                say_verde("Du-te si fa rost de panza de paianjen.")
			end

		end
	end	
  state __GIVEUP__ begin
  end
  state __COMPLETE__ begin
	  when enter begin
		q.done()
	  end
	  
  end
  end