---------------------------------------------------------------------------------------
-------------------			”84 Misiuni in romana oficiale” pack.	-------------------
-------------------			 Munca realizata de Pablo Escopar.		-------------------
-------------------				Skype: mesesan_paul_calin			-------------------
---------------------------------------------------------------------------------------
quest subquest_36 begin
        state start begin
                when login or levelup with pc.level >= 47 and pc.level <= 49 begin
                        set_state(information)
                end
        end

        state information begin
                when letter begin
                        local v=find_npc_by_vnum(20005)
                        if 0==v then
                        else
                                target.vid("__TARGET__", v, "Yonah")
                        end
                end


        when __TARGET__.target.click or
                    20005.chat."Grajdurile" begin
                        target.delete("__TARGET__")
                        say_title("Yonah:")
                        say_verde("")
                        say_verde("Prietenul meu, Grajdarul are nevoie de")
                        say_verde("10 fan pentru afecerea lui, te ocupi tu?")
                        local s=select("Sigur","Nu am timp")
                        if 2==s then
                                say_title("Yonah:")
                                say_verde("")
                                say_verde("Vrei sa abandonezi misiunea?")
                                say_verde("")
                                local a=select("Da, vreau","Inchide")
                                if  2==a then
                                        say_title("Yonah:")
                                        say_verde("")
                                        say_verde("Oh, ce bine ca te-ai razgandit.")
                                        return
                                end
                                say_title("Yonah:")
                                say_verde("")
                                say_verde("Atunci nu mai avem ce discuta!")
                                set_state(__GIVEUP__)
                                return
                        end
                        say_title("Yonah:")
                        say_verde("")
                        say_verde("Du-te si fa rost de 10 fan!")
                        set_state(for_horse)
                end
        end


state for_horse begin
        when letter begin
                        send_letter("~Lv 47 - Grajdarul")
                        q.set_icon("scroll_open_golden.tga")
                if         pc.count_item(50054)>=10 then
                        local v=find_npc_by_vnum(20349)
                        if 0==v then
                        else
                                target.vid("__TARGET__", v, "Du-te la Grajdar")
                        end
                end

        end
        when button or info begin
                if      pc.count_item(50054)>=10 then
                        say_title("Grajdarul")
                        say_verde("")
                        say_verde("Ai obtinut 10 fan, du-te la Grajdar.")
                        return
                end

                say_title("Grajdarul")
                say_verde("")
                say_verde("Obtine 10 fan pentru grajdar.")
        end



        when 20349.chat."Fan pentru Grajdar" with pc.count_item(50054) ==0 or
        pc.count_item(50054) < 10 begin
                say_title("Grajdar:")
                say_verde("")
                say_verde("Nu ai fanul, mergi sa mai incerci?")
            local s=select("Ma ocup eu","Nu am timp")
            if 1==s then
                        say_pc_name()
                        say_verde("")
                        say_verde("Bine, am sa mai incerc.")
                        return

            else
                        say_pc_name()
                        say_verde("")
                        say_verde("Nu am timp, imi pare foarte rau.")
                        wait()
                        say_title("Grajdar:")
                        say_verde("")
                        say_verde("Vrei sa abandonezi misiunea?")

                        local s=select("Da, vreau","Inchide")
                        if 2==s then
                                say_title("Gajdar:")
                                say_verde("")
                                say_verde("Oh, ce bine ca te-ai razgandit.")
                                return

                        elseif 1==s then
                                say_title("Gajdar:")
                                say_verde("")
                                say_verde("Atunci, la revedere placuta.")
                                set_state(__GIVEUP__)
                        end
            end
        end



        when __TARGET__.target.click or
                20349.chat."Am facut rost de fan" with pc.count_item(50054)>=10 begin
                target.delete("__TARGET__")
                say_title("Grajdar:")
                say_verde("")
                say_verde("Ai facut rost? Iti multumesc enorm!")
                say_verde("Yonah te-a trimis? Oh, de bine!")
                say_verde("")
                say_reward("Recompensa:")
                say_reward("6.000.000 Puncte de experienta")
                say_reward("270.000 Yang")
                say_reward("x4 Cufar lumina lunii")
                pc.give_exp2(6000000)
                pc.change_money(270000)
                pc.give_item2(50011,4)

                pc.remove_item(50054,10)
                set_state(OLD_MAN_DONE)
        end
  end

  state OLD_MAN_DONE begin
        when letter begin
                        send_letter("~Lv 47 - Du-te la Yonah")
                        q.set_icon("scroll_open_golden.tga")
                        local v=find_npc_by_vnum(20005)
                        if 0==v then
                        else
                                target.vid("__TARGET__", v, "Du-te la Yonah")
                        end

                end
        when button or info begin
                say_title("Du-te la Yonah")
                say_verde("")
                say_verde("L-ai ajutat pe grajdar, acum du-te")
                say_verde("si vorbeste cu Yonah si spune-i.")
        end
        when __TARGET__.target.click or
                20005.chat."Am rezolvat" begin
                target.delete("__TARGET__")
                say_title("Yonah:")
                say_verde("")
                say_verde("Ai facut o treaba buna, Grajdarul nu")
                say_verde("se descurca prea bine, sarmanul de el.")
                say_verde("")
                say_reward("Recompensa Bonus:")
                say_reward("x1 Acadea")
		        pc.give_item2(71136) 
                set_quest_state("levelup","run")
                set_state(__COMPLETE__)
                clear_letter()

        end
end
    state __COMPLETE__ begin
                when enter begin
                        q.done()
                end
        end
        state __GIVEUP__ begin
    end
end