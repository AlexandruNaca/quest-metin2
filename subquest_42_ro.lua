---------------------------------------------------------------------------------------
-------------------			”84 Misiuni in romana oficiale” pack.	-------------------
-------------------			 Munca realizata de Pablo Escopar.		-------------------
-------------------				Skype: mesesan_paul_calin			-------------------
---------------------------------------------------------------------------------------
quest subquest_42 begin
        state start begin
                when login or levelup with pc.level >= 46 and pc.level <= 48 begin
                        set_state(information)
                end
        end

        state information begin
                when letter begin

                        local vnum=0

                        if pc.get_empire() == 1 then
                                vnum= 20306
                        elseif pc.get_empire() == 2 then
                                vnum= 20326
                        elseif pc.get_empire() == 3 then
                                vnum=20346
                        end


                        local v=find_npc_by_vnum(vnum)
                        if 0==v then
                        else
                                target.vid("__TARGET__", v, "Amintirea mortii")
                        end
                end

                when __TARGET__.target.click or
                 20306.chat."Amintirea mortii"  begin
                        target.delete("__TARGET__")
                        say_title("Invatator:")
                        say_verde("")
                        ---                                                   l
                        say_verde("Am nevoie de Invatatura din Templu si")
                        say_verde("de Fularul din Templu, insa nu am timp")
                        say_verde("sa fac rost de ele, trebuie sa instructez")
                        say_verde("razboinicii noi, imi faci tu rost de ele ?")

                        local s=select("Sigur","Nu am timp")
                        if 2==s then
                                say_title("Invatator:")
                                say_verde("")
                                say_verde("Vrei sa abandonezi misiunea?")
                                say_verde("")
                                local a=select("Da, vreau","Inchide")
                                if  2==a then
                                        say_title("Invatator:")
                                        say_verde("")
                                        say_verde("Oh, ce bine ca te-ai razgandit.")
                                        return
                                end
                                say_title("Invatator:")
                                say_verde("")
                                say_verde("Atunci nu mai avem ce discuta!")
                                set_state(__GIVEUP__)
                                return
                        end
                        say_title("Invatator:")
                        say_verde("")
                        say_verde("Du-te si omoara armata intunecata")
                        say_verde("mandru, care este in Templul Hwang.")
                        set_state(for_the_die)

                        end

                when __TARGET__.target.click or
                 20326.chat."Amintirea mortii"  begin
                        target.delete("__TARGET__")
                        say_title("Invatator:")
                        say_verde("")
                        ---                                                   l
                        say_verde("Am nevoie de Invatatura din Templu si")
                        say_verde("de Fularul din Templu, insa nu am timp")
                        say_verde("sa fac rost de ele, trebuie sa instructez")
                        say_verde("razboinicii noi, imi faci tu rost de ele ?")

                        local s=select("Sigur","Nu am timp")
                        if 2==s then
                                say_title("Invatator:")
                                say_verde("")
                                say_verde("Vrei sa abandonezi misiunea?")
                                say_verde("")
                                local a=select("Da, vreau","Inchide")
                                if  2==a then
                                        say_title("Invatator:")
                                        say_verde("")
                                        say_verde("Oh, ce bine ca te-ai razgandit.")
                                        return
                                end
                                say_title("Invatator:")
                                say_verde("")
                                say_verde("Atunci nu mai avem ce discuta!")
                                set_state(__GIVEUP__)
                                return
                        end
                        say_title("Invatator:")
                        say_verde("")
                        say_verde("Du-te si omoara armata intunecata")
                        say_verde("mandru, care este in Templul Hwang.")
                        set_state(for_the_die)

                        end



                when __TARGET__.target.click or
                 20346.chat."Amintirea mortii"  begin
                        target.delete("__TARGET__")
                        say_title("Invatator:")
                        say_verde("")
                        ---                                                   l
                        say_verde("Am nevoie de Invatatura din Templu si")
                        say_verde("de Fularul din Templu, insa nu am timp")
                        say_verde("sa fac rost de ele, trebuie sa instructez")
                        say_verde("razboinicii noi, imi faci tu rost de ele ?")

                        local s=select("Sigur","Nu am timp")
                        if 2==s then
                                say_title("Invatator:")
                                say_verde("")
                                say_verde("Vrei sa abandonezi misiunea?")
                                say_verde("")
                                local a=select("Da, vreau","Inchide")
                                if  2==a then
                                        say_title("Invatator:")
                                        say_verde("")
                                        say_verde("Oh, ce bine ca te-ai razgandit.")
                                        return
                                end
                                say_title("Invatator:")
                                say_verde("")
                                say_verde("Atunci nu mai avem ce discuta!")
                                set_state(__GIVEUP__)
                                return
                        end
                        say_title("Invatator:")
                        say_verde("")
                        say_verde("Du-te si omoara armata intunecata")
                        say_verde("mandru, care este in Templul Hwang.")
                        set_state(for_the_die)

                        end

                end


        state for_the_die begin

                when letter begin

                        send_letter("~Lv 46 - Amintirea mortii")
                        q.set_icon("scroll_open_golden.tga")
                        q.start()

                        if  pc.count_item(30147) >=1 and  pc.count_item(30148) >=1 then
                                        local vnum=0

                                        if pc.get_empire() == 1 then
                                                vnum= 20306
                                        elseif pc.get_empire() == 2 then
                                                vnum= 20326
                                        elseif pc.get_empire() == 3 then
                                                vnum= 20346
                                        end

                                        local v=find_npc_by_vnum(vnum)
                                        if 0!= v then
                                                target.vid("__TARGET__",v,"Du-te la Invatator")
                                        end
                                end

                end


                when info or  button begin
                        if  pc.count_item(30147) >=1 and  pc.count_item(30148) >=1 then
                                say_title("Amintirea mortii")
                                say_verde("")
                                say_verde("Ai facut rost de invatatura si de")
                                say_verde("fular, intoarce-te la Invatator..")
                                return
                        end

                        say_title("Amintirea mortii")
                        say_verde("")
                        say_verde("Invatatorul are nevoie de Invatatura")
                        say_verde("din templu si Fularul din templu.")
                        say_verde("")
                        say_verde("Du-te in Templul Hwang si omoara")
                        say_verde("armata intuecata mandru si obtine-le.")
                end



                when 734.kill or 735.kill or 736.kill  begin
                        local s = number(1, 100)

                        if s <= 5 and pc.count_item(30147)==0 then
                                pc.give_item2(30147, 1)
                        end

                        local a = number(1, 100)
                        if a <= 5 and pc.count_item(30148)==0 then
                                pc.give_item2(30148, 1)
                        end


                end


                when __TARGET__.target.click or
                        20306.chat."Amintirea mortii" with pc.count_item(30147) >=1 and  pc.count_item(30148) >=1 begin

                        target.delete("__TARGET__")
                        say_title("Invatator:")
                        say_verde("")
                        say_verde("Ai facut rost? Minunat, multumesc frumos.")
                        say_verde("")
                        say_reward("Recompensa:")
                        say_reward("9.000.000 Puncte de experienta")
                        say_reward("360.000 Yang")
                        say_reward("x4 Cufar lumina lunii")
                        say_reward("x100 Piatra diamant")
                        pc.remove_item(30147,1)
                        pc.remove_item(30148,1)
                        pc.give_exp2(9000000)
                        pc.change_money(360000)
                        pc.give_item2(50011,4)
                        pc.give_item2(50601,100)
                        set_quest_state("levelup","run")
                        clear_letter()
                        set_state(COMPLETE)

                end

                when __TARGET__.target.click or
                        20326.chat."Amintirea mortii." with pc.count_item(30147) >=1 and  pc.count_item(30148) >=1 begin

                        target.delete("__TARGET__")
                        say_title("Invatator:")
                        say_verde("")
                        say_verde("Ai facut rost? Minunat, multumesc frumos.")
                        say_verde("")
                        say_reward("Recompensa:")
                        say_reward("9.000.000 Puncte de experienta")
                        say_reward("360.000 Yang")
                        say_reward("x4 Cufar lumina lunii")
                        say_reward("x100 Piatra diamant")
                        pc.remove_item(30147,1)
                        pc.remove_item(30148,1)
                        pc.give_exp2(9000000)
                        pc.change_money(360000)
                        pc.give_item2(50011,4)
                        pc.give_item2(50601,100)
                        set_quest_state("levelup","run")
                        clear_letter()
                        set_state(COMPLETE)

                end

                when __TARGET__.target.click or
                        20346.chat."You got the Esoteric Dogmata and the Esoteric Symbol." with pc.count_item(30147) >=1 and  pc.count_item(30148) >=1 begin

                        target.delete("__TARGET__")
                        say_title("Invatator:")
                        say_verde("")
                        say_verde("Ai facut rost? Minunat, multumesc frumos.")
                        say_verde("")
                        say_reward("Recompensa:")
                        say_reward("9.000.000 Puncte de experienta")
                        say_reward("360.000 Yang")
                        say_reward("x4 Cufar lumina lunii")
                        say_reward("x100 Piatra diamant")
                        pc.remove_item(30147,1)
                        pc.remove_item(30148,1)
                        pc.give_exp2(9000000)
                        pc.change_money(360000)
                        pc.give_item2(50011,4)
                        pc.give_item2(50601,100)
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