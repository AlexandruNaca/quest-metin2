---------------------------------------------------------------------------------------
-------------------			”84 Misiuni in romana oficiale” pack.	-------------------
-------------------			 Munca realizata de Pablo Escopar.		-------------------
-------------------				Skype: mesesan_paul_calin			-------------------
---------------------------------------------------------------------------------------
quest subquest_21 begin
        state start begin
                when login or levelup with pc.level >= 48 and pc.level <= 50 begin
                        set_state(information)
                end
        end

        state information begin
                when letter begin
                        local v=find_npc_by_vnum(20020)
                        if 0==v then
                        else
                                target.vid("__TARGET__", v, "Du-te la Tradatorul Balso")
                        end
                end

                when __TARGET__.target.click or 20020.chat."Gasestea leacul" begin
			----"123456789012345678901234567890123456789012345678901234567890"|
  	                target.delete("__TARGET__")
                        say_title("Tradatorul Balso:")
                        say_verde("")
                        say_verde("Ma simt cam rau, cred ca am racit sau")
                        say_verde("am febra, aveam tot timpul la mine un")
                        say_verde("Leac dar l-au firat oamenii ciumei.")
                        say_verde("")
                        say_verde("Ma ajuti sa imi recuperez leacul te rog?")
                        local s=select("Sigur","Nu am timp")
                        if 2==s then
                                say_title("Tradatorul Balso:")
                                say_verde("")
                                say_verde("Vrei sa abandonezi misiunea?")
                                say_verde("")
                                local a=select("Da, vreau","Inchide")
                                if  2==a then
                                        say_title("Tradatorul Balso:")
                                        say_verde("")
                                        say_verde("Oh, ce bine ca te-ai razgandit.")
                                        return
                                end
                                say_title("Tradatorul Balso:")
                                say_verde("")
                                say_verde("Atunci nu mai avem ce discuta!")
                                set_state(__GIVEUP__)
                                return
                        end
                        say_title("Tradatorul Balso:")
                        say_verde("")
                        say_verde("Du-te si omoara oameni ai ciumei.")
                        set_state(accept_request)


        	end

        end


        state accept_request begin

                when letter begin
                        send_letter("~Lv 48 - Gaseste leacul")
                        q.set_icon("scroll_open_golden.tga")

                        if pc.count_item(30152)>0 then
                                local v=find_npc_by_vnum(20020)
                                if 0!= v then
                                        target.vid("__TARGET__",v,"Du-te la Tradatorul Balso")
                                end
                        end

                end


                when info or  button begin
                        if pc.count_item(30152) >0 then
                                say_title("Gaseste leacul")
                                say_verde("")
                                ----"123456789012345678901234567890123456789012345678901234567890"|

                                say_verde("Ai obtinut Leacul lui Balso, acum du-te")
                                say_verde("si vorbeste cu el pana nu e prea tarziu.")
                                return
                        end

                        say_title("Gaseste leacul")
                        say_verde("")
                        ----"123456789012345678901234567890123456789012345678901234567890"|
                        say_verde("Tradatorul Balso are nevoie de Leacul")
                        say_verde("furat de oamenii ciumei, du-te pe muntele")
                        say_verde("sohan si recupereaza leacul pentru balso.")

                end



                when 903.kill with pc.count_item(30152) == 0 begin
                        local s = number(1, 100)
                        if s <= 5 then
                                pc.give_item2(30152, 1)
                        end
                end



                when  __TARGET__.target.click or 20020.chat."Am gasit leacul" with pc.count_item(30152) > 0 begin
                        target.delete("__TARGET__")
                        say_title("Tradatorul Balso:")
                        say_verde("")
                        ----"123456789012345678901234567890123456789012345678901234567890"|

                        say_verde("Iti multumesc din suflet, m-ai salvat.")
                        say_verde("")
                        say_reward("Recompensa:")
                        say_reward("10.000.000 Puncte de experienta")
                        say_reward("380.000 Yang")
                        say_reward("x5 Cufar lumina lunii")
                        say_reward("x10 Ou magic")
                        pc.remove_item(30152,1)
                        pc.give_exp2(10000000)
                        pc.change_money(380000)
                        pc.give_item2(50011,4)
                        pc.give_item2(71150,10)
                        set_quest_state("levelup","run")
                        clear_letter()
                        set_state(COMPLETE)
                end

end

        state __GIVEUP__ begin
        end

        state COMPLETE begin
                when enter begin
                        q.done()
                end
        end


end