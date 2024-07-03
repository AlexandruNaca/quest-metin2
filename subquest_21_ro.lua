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
                                target.vid("__TARGET__", v, "Tradatorul Balso")
                        end
                end

                when __TARGET__.target.click or 20020.chat."Am o problema" begin
            ----"123456789012345678901234567890123456789012345678901234567890"|
                    target.delete("__TARGET__")
                        say_title("Balso:")
                        say("")
                        say("Am nevoie de un leac medicinal, poti sa")
                        say("ma ajuti sa fac rost de aceasta medicina?")
                        local s=select("Ma ocup eu","Nu am timp")
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
                        say_verde("Du-te si omoara om al ciumei.")
                        set_state(accept_request)


            end

        end


        state accept_request begin

                when letter begin
                        send_letter("~Lv 48 - Leacul pentru balso")
                        q.set_icon("scroll_open_golden.tga")

                        if pc.count_item(30152)>0 then
                                local v=find_npc_by_vnum(20020)
                                if 0!= v then
                                        target.vid("__TARGET__",v,"Du-te la Balso")
                                end
                        end

                end


                when info or  button begin
                        if pc.count_item(30152) >0 then
                                say_title("Du-te la Balso")
                                say("")
                                ----"123456789012345678901234567890123456789012345678901234567890"|

                                say("Ai facut rost de leac, du-te la Balso.")
                                return
                        end

                        say_title("Leacul pentru Balso")
                        say("")
                        ----"123456789012345678901234567890123456789012345678901234567890"|
                        say("Balso are nevoie de un leac necunoscut")
                        say("pentru el, du-te si omoara om al ciuemi.")

                end



                when 903.kill with pc.count_item(30152) == 0 begin
                        local s = number(1, 100)
                        if s <= 5 then
                                pc.give_item2(30152, 1)
                        end
                end



                when  __TARGET__.target.click or 20020.chat."Am gasit leacul" with pc.count_item(30152) > 0 begin
                        target.delete("__TARGET__")
                        say_title("Balso:")
                        say("")
                        ----"123456789012345678901234567890123456789012345678901234567890"|

                        say("Oh, multumesc din suflet pentru ajutor.")
                        say("")
                        say_reward("Recompensa:" )
                        say_reward("9.000.000 Puncte de experienta")
                        say_reward("280.000 Yang")
                        say_reward("x20 Mantia curajului")
                        say_reward("x4 Cufar lumina lunii")
                        pc.give_exp2(9000000)
                        pc.change_money(280000)
                        pc.give_item2(70038, 20)
                        pc.give_item2(50011, 4)
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