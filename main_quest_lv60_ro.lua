---------------------------------------------------------------------------------------
-------------------			”84 Misiuni in romana oficiale” pack.	-------------------
-------------------			 Munca realizata de Pablo Escopar.		-------------------
-------------------				Skype: mesesan_paul_calin			-------------------
---------------------------------------------------------------------------------------
quest main_quest_lv60 begin
	state start begin
		when login or levelup or enter with pc.get_level() >= 60 begin
			if pc.getf("main_quest_lv55", "__status")==main_quest_lv55.__COMPLETE__ then
				set_state( quest1_begin )
			end
		end
	end
	
	state run begin
		when login or levelup or enter with pc.get_level() >= 60 begin
			set_state( quest1_begin )
		end
	end

	state quest1_begin begin
		when letter begin    --퀘스트편지1
            send_letter( "+Lv 60 - Natiunea intunecata" )
            q.set_icon("scroll_open_purple.tga")
			
			-- 을두지를 가리킨다.
			local vid_20011 = find_npc_by_vnum(20011)
			if 0 != vid_20011 then
				target.vid("__TARGET__", vid_20011, mob_name(20011))
			end
		end

		when button or info begin  -- 퀘스트편지1 내용
			say_title("Natiunea intunecata")
			say_verde("")
			----"123456789012345678901234567890123456789012345678901234567890"|
			say_verde("Uriel a gasit indicii noi despre Jurnalul")
			say_verde("secret, du-te si vorbeste cu el de indata.")
			say_verde("")
			
		end
		
		when __TARGET__.target.click begin
			target.delete("__TARGET__")
			
			say_title("Uriel:")
			----"123456789012345678901234567890123456789012345678901234567890"|
			say_verde("A trecut multa vreme de cand m-ai ajutat")
			say_verde("sa strangem cele 13 pagini din jurnalul")
			say_verde("secret, iti mai amintesti ?")
			wait()
			
			say_title(pc.getname())
			say_verde("")
			say_verde("Desigur ca imi amintesc, ai gasit ceva?")
			wait()
			
			say_title(mob_name(20011))
			say_verde("")
			say_verde("Exact! Daca mai sti, nu am aflat nimic")
			say_verde("folositor, dar am continuat studiile.")
			say_verde("")
			say_verde("Am aflat ca putem afla detalii noi despre")
			say_verde("jurnal, trebuie sa cauti un monument vechi")
			say_verde("de pe muntele sohan, grabeste-te!")
			set_state( quest2_ongoing )
		end
	end

	state quest2_ongoing begin --을두지와 대화하고 탁본을 받아오라는 미션을 받았다.
		-----------퀘스트편지2------------
		when letter begin
            send_letter( "+Lv 60 - Natiunea intunecata" )
            q.set_icon("scroll_open_purple.tga")

			-- 흑암국의 고대 비석을 가리킨다. (지금은 마을 npc를 가리킨다.)
			local v = find_npc_by_vnum(20371)
			if 0 != v then
				target.vid("__TARGET__", v, mob_name(20371))
			end
		end

		when button or info begin
			say_title("Natiunea intunecata")
			say_verde("")
			----"123456789012345678901234567890123456789012345678901234567890"|
			say_verde("Uriel crede ca totusi mai sunt informatii")
			say_verde("despre jurnalul secret, du-te pe muntele")
			say_verde("sohan si cauta langa monumentul vechi.")
		end
		
		--을두지를 선택하면 해당 퀘스트에 관련된 대화를 나눌 수 있다.
		when 20011.chat."Natiunea intunecata" begin
			say_title(mob_name(20011))
			say_verde("")
			say_verde("Du-te pe muntele sohan si cauta langa")
			say_verde("monumentul vechi.")
			say_verde("")
		end
		
		--흑암국의 고대 비석을 누르면. 
		when 20371.click begin
			target.delete("__TARGET__")
			say_title("Monument vechi")
			say_verde("")
			say_verde("Ai gasit inscriptii vechi scrise pe acest")
			say_verde("monument. Le-ai copiat cu atentie.")
			say_verde("")
			pc.give_item2 ( 31001 )
			
			set_state(quest2_end)
		end
	end
		
	--고대 비석의 탁본을 얻었다.
	state quest2_end begin
		-----------퀘스트편지2------------
		when letter begin
            send_letter( "+Lv 60 - Natiunea intunecata" )
            q.set_icon("scroll_open_purple.tga")

			-- 을두지를 가리킨다.
			local v = find_npc_by_vnum(20011)
			if 0 != v then
				target.vid("__TARGET__", v, mob_name(20011))
			end
		end

		when button or info begin
			say_title("Natiunea intunecata")
			say_verde("")
			say_verde("Ai copiat inscriptiile de pe monumentul")
			say_verde("vechi. Du-te si dai-le lui Uriel.")
			say_verde("")
		end
		
		when __TARGET__.target.click begin
			pc.remove_item ( 31001, 1 )
			target.delete("__TARGET__")
			
			say_title(mob_name(20011))
			say_verde("")
			----"123456789012345678901234567890123456789012345678901234567890"|
			say_verde("In sfarsit! Haide sa studiem inscriptiile.")
			say_verde("[DELAY value;150]        [/DELAY]")
			say_verde("")
			say_verde("Spune ca jurnalul intunecat nu are nimic")
			say_verde("de aface cu misterul pietrelor metin.")
			wait()
			
			say_title(mob_name(20011))
			say_verde("")
			say_verde("Sfinte sisoe! Acum totul are sens.")
			say_verde("")
			say_verde("De aceea nu am gasit ce cautam in")
			say_verde("jurnalul secret, la naiba.")
			say_verde("")
			wait()
			
			say_title(mob_name(20011))
			say_verde("")
			say_verde("Ai facut o treaba excelenta, multumesc.")
			say_verde("")
			say_reward("Recompensa:")
			say_reward("30.000.000 Puncte de experienta")
			say_reward("3.000.000 Yang")
			say_reward("x80 Mantia curajului")
			say_reward("x20 Binecuvantarea dragon")
			say_reward("x10 Cufar mistic")
			pc.give_exp2(30000000)
			pc.change_money(3000000)
			pc.give_item2(70038, 80)
			pc.give_item2(71020, 20)
			pc.give_item2(50217, 10)
		
			set_state(quest3_begin)
		end
	
	end
	
	state quest3_begin begin
		-------퀘스트편지3---------
		when letter begin
            send_letter( "+Lv 60 - Natiunea intunecata II" )
            q.set_icon("scroll_open_purple.tga")

			-- 을두지를 가리킨다.
			local v = find_npc_by_vnum(20011)
			if 0 != v then
				target.vid("__TARGET__", v, mob_name(20011))
			end
		end

		when button or info begin
			say_title("Natiunea intunecata II")
			say_verde("")
			say_verde("Uriel te cauta, du-te si vorbeste cu el.")
		end
		
		when __TARGET__.target.click begin
			target.delete("__TARGET__")
			say_title(mob_name(20011))
			say_verde("")
			----"123456789012345678901234567890123456789012345678901234567890"|
			say_verde("Datorita tie am reusit sa aflam informatii")
			say_verde("despre natiunea intunecata, dar avem nevoie")
			say_verde("de mai multe detalii ca sa terminam cercetarea.")
			say_verde("")
			say_verde("Dute in Padurea fantoma si omoara Copac Rau")
			say_verde("pana ai sa obtii ceva informatii folositoare.")
			
			set_state(quest3_ongoing1)
		end	
	end
	
	state quest3_ongoing1 begin
		when letter begin
            send_letter( "+Lv 60 - Natiunea intunecata II" )
            q.set_icon("scroll_open_purple.tga")
		end

		when button or info begin
			say_title("Natiunea intunecata II")
			say_verde("")
			say_verde("Dupa spusele lui Uriel, trebuie sa mergi")
			say_verde("in Padurea fantoma si sa omori Copac Rau.")
		end

		--을두지를 선택하면 해당 퀘스트에 관련된 대화를 나눌 수 있다.
		when 20011.chat.locale.main_quest_lv60.title_4 begin
			say_title(mob_name(20011))
			say_verde("")
			say_verde("Trebuie sa mergi sa omori copac rau in")
			say_verde("padurea fantoma, dupa muntele sohan.")
		end
		
		--흑적귀목을 잡았을때 1000분의 1 확률로 퀘스트 조건을 만족시켜 준다.
		when 2305.kill begin
			if number (1,300) == 1 then	
				pc.give_item2 ( 31002, 1 )	
				say_title("Natiunea intunecata II")
				say_verde("")
				say_verde("In timp ce omori creaturi malefice, un")
				say_verde("document vechi iti apare in cale, du-te")
				say_verde("cu acesta la Uriel si vezi ce ar putea fi.")

				set_state(quest3_end1)
			end
		end
	end
	
	-- 고대문서를 하나 얻었다. 을두지에게 가져다줘야한다.
	state quest3_end1 begin
		-------퀘스트편지3---------
		when letter begin
            send_letter( "+Lv 60 - Natiunea intunecata II" )
            q.set_icon("scroll_open_purple.tga")

			-- 을두지를 가리킨다.
			local v = find_npc_by_vnum(20011)
			if 0 != v then
				target.vid("__TARGET__", v, mob_name(20011))
			end
		end

		when button or info begin
			say_title("Natiunea intunecata II")
			say_verde("")
			say_verde("In timp ce ai omorat creaturi malefice, un")
			say_verde("document vechi ti-a apare in cale, du-te")
			say_verde("cu acesta la Uriel si vezi ce ar putea fi.")
		end
		
		when __TARGET__.target.click begin
			target.delete("__TARGET__")
			say_title(mob_name(20011))
			----"123456789012345678901234567890123456789012345678901234567890"|
			say_verde("Ce? Ce este asta? Nu pot sa cred.")
			say_verde("")
			say_verde("Aproape ca acest document este gol, ar")
			say_verde("trebui sa aibe 9 pagini in el, du-te")
			say_verde("inapoi si gaseste restul de pagini.")
			pc.remove_item ( 31002, 1 )	
			set_state(quest3_ongoing2)
		end	
		
	end
	
	state quest3_ongoing2 begin
		--이 상태에 처음 들어오게 되면 '남은 고대의 문서' 퀘스트 플래그를 생성한다.
		-- 초기값은 9로 시작해서 몬스터를 잡을때마다 1씩 줄여 0까지 간다.
		-- 0이 되면 퀘스트 스테이트를 변화시킨다.
		when enter begin
			pc.setqf("remain_item",9)
		end
		
		--*************************--
		-------퀘스트편지3_1---------
		when letter begin
            send_letter( "+Lv 60 - Natiunea intunecata II" )
            q.set_icon("scroll_open_purple.tga")

			-- 흑적귀목의 위치를 표시한다.--
			--------------------------------
			--------------------------------
		end
		when button or info begin
			say_title("Natiunea intunecata II")
			say_verde("")
			say_verde("Uriel te-a trimis sa gasesti cele 9")
			say_verde("pagini lipsa din documentul vechi.")
			say_verde("")
			q.set_counter("Pagini ramase: ", pc.getqf("remain_item"))
		end

		--흑적귀목을 잡았을때 1000분의 1 확률로 남은 고대 문서 수를 줄여준다.
		when 2305.kill begin
			if number (1,300) == 1 then
				local remain_item_prev =  pc.getqf("remain_item")
				pc.setqf("remain_item",remain_item_prev-1)
			
				pc.give_item2 ( 31002, 1 )					
				-- 모든 문서를 다 얻었으면 다음 퀘스트로 넘어간다.
				if pc.getqf("remain_item")==0 then
					-- 흑적귀목의 위치 표시를 없애준다 --
					-------------------------------------
					-------------------------------------
					notice("Anunt: Ai gasit toate paginile din documentului vechi.")
					set_state(quest3_end2)
					
				else
					notice("Anunt: Ai gasit o pagina! Ti-au mai ramas "..pc.getqf("remain_item").." pagini de gasit.!")
				end
			end
		end
	end
	
	state quest3_end2 begin
		--*************************--
		-------퀘스트편지3_1---------
		when letter begin
            send_letter( "+Lv 60 - Natiunea intunecata II" )
            q.set_icon("scroll_open_purple.tga")

			-- 을두지를 가리킨다.
			local v = find_npc_by_vnum(20011)
			if 0 != v then
				target.vid("__TARGET__", v, mob_name(20011))
			end
		end
		when button or info begin
			say_title("Natiunea intunecata II")
			say_verde("")
			say_verde("Ai gasit toate paginile lipsa ale")
			say_verde("documentului vechi, du-te la Uriel.")
		end
		-----------------------------
		--*************************--
	
		when __TARGET__.target.click begin
			target.delete("__TARGET__")
			pc.remove_item ( 31002, pc.count_item (31002) )	
			say_title(mob_name(20011))
			say_verde("")
			----"123456789012345678901234567890123456789012345678901234567890"|
			say_verde("In regula, sa vedem ce scrie acum ...")
			say_verde("[DELAY value;150]        [/DELAY]")
			say_verde("")
			say_verde("Se pare ca natiunea intunecata este cea")
			say_verde("care a blestemat pamantul cu pietre metin.")
			say_verde("Nu exista vre-o scapare pentru acest")
			say_verde("blestem, aceasta este soarta regatelor.")
			wait()
			say_title(mob_name(20011))
			say_verde("")
			say_verde("Ai facut o treaba buna, ca de obicei.")
			say_verde("")
			say_reward("Recompensa:")
			say_reward("30.000.000 Puncte de experienta")
			say_reward("3.000.000 Yang")
			say_reward("x100 Mantia curajului")
			say_reward("x30 Binecuvantarea dragon")
			say_reward("x10 Cufar mistic")
			pc.give_exp2(30000000)
			pc.change_money(3000000)
			pc.give_item2(70038, 100)
			pc.give_item2(71020, 30)
			pc.give_item2(50217, 10)
			
			set_state(quest4_begin)
		end	
	end

	state quest4_begin begin
		--*************************--
		-------퀘스트편지4-----------
		when letter begin
            send_letter( "+Lv 60 - Sfarsitul aventurii" )
            q.set_icon("scroll_open_purple.tga")

			-- 을두지를 가리킨다.
			local v = find_npc_by_vnum(20011)
			if 0 != v then
				target.vid("__TARGET__", v, mob_name(20011))
			end
		end
		when button or info begin
			say_title("Sfarsitul aventurii")
			say_verde("")
			----"123456789012345678901234567890123456789012345678901234567890"|
			say_verde("Uriel te cauta, du-te si vorbeste cu el.")
		end
		-----------------------------
		--*************************--
	
	
		when __TARGET__.target.click begin
			target.delete("__TARGET__")
			say_title(mob_name(20011))
			----"123456789012345678901234567890123456789012345678901234567890"|
			say_verde("")
			say_verde("Intradevar, aventura noastra sa terminat.")
			say_verde("")
			say_verde("Iti multumesc ca ai fost alaturi de mine")
			say_verde("si alaturi de sat tot acest timp")
			wait()
			say_title(mob_name(20011))
			say_verde("")
			say_reward("Mult noroc in continuare razboinicule!")
			say_verde("")
			say_reward("Recompensa:")
			say_reward("x1 Papuci de vant+")
			say_reward("x1 Inelul experientei ( 30 Minute )")
			say_reward("x2 Perla alba")
			say_reward("x2 Perla albastra")
			say_reward("x2 Perla visinie")
			pc.give_item2(72702)
			pc.give_item2(72002)
			pc.give_item2(27992,2)
			pc.give_item2(27993,2)
			pc.give_item2(27994,2)
			
			--@@@ 버그 @@@--
			--1. 퀘스트 편지가 새로 나타난다.
			clear_letter()
			set_state(__COMPLETE__)
		end	
	end
	
	state __COMPLETE__ begin
		when enter begin
			q.done()
		end
	end
end