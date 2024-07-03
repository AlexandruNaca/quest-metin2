---------------------------------------------------------------------------------------
-------------------			”84 Misiuni in romana oficiale” pack.	-------------------
-------------------			 Munca realizata de Pablo Escopar.		-------------------
-------------------				Skype: mesesan_paul_calin			-------------------
---------------------------------------------------------------------------------------
quest subquest_47  begin
        state start begin
                when login or levelup with pc.level >= 50  and pc.level <= 52 begin
                        set_state( information )
                end
        end

        state information begin
                when letter begin

                        local v=find_npc_by_vnum(20355)
                        if 0==v then
                        else
                                target.vid("__TARGET__", v, "Du-te la Capitan")
                        end
                end

                when __TARGET__.target.click or
                        20355.chat."Descifrarea textului" with  pc.level >= 50 begin
                        target.delete("__TARGET__")

                        say_title("Capitan:")
                        say_verde("")
                        say_verde("Am primit o informatie de la un spion")
                        say_verde("dar aceasta este criptata, ma ajuti sa")
                        say_verde("descifram aceasta informatie?")
                        local s=select("Sigur","Nu am timp")
                        if 2==s then
                                say_title("Capitan:")
                                say_verde("")
                                say_verde("Vrei sa abandonezi misiunea?")
                                say_verde("")
                                local a=select("Da, vreau","Inchide")
                                if  2==a then
                                        say_title("Capitan:")
                                        say_verde("")
                                        say_verde("Oh, ce bine ca te-ai razgandit.")
                                        return
                                end
                                say_title("Capitan:")
                                say_verde("")
                                say_verde("Atunci nu mai avem ce discuta!")
                                set_state(__GIVEUP__)
                                return
                        end
                        say_title("Capitan:")
                        say_verde("")
                        say_verde("Super, haide sa incercam.")
                        wait()
                        ---                                                   l
                        say_title("Capitan:")
                        say_verde("")
                        say_reward("ICIIANM")
                        say_reward("ZIVTUA")
                        say_reward("AL")
                        say_reward("TROOZNI")
                        wait()
                        say_title("Capitan:")
                        say_verde("")
                        say_verde("Deci, ai vreo idee ce inseamna?")
                        local s=select("Gata, stiu!","Nu stiu...","Arata din nou")
                        if 2==s then
                                say_title("Capitan:")
                                say_verde("")
                                say_verde("Vrei sa abandonezi misiunea?")
                                local a=select("Da, vreau","Inchide")
                                if  2==a then
                                        say_title("Capitan:")
                                        say_verde("")
                                        say_verde("Oh, ce bine ca te-ai razgandit.")
                                        return
                                end
                                ----"12345678901234567890123456789012345678901234567890"|
                                say_title("Capitan:")
                                say_verde("")
                                say_verde("Chiar era asa de greu pentru tine?")
                                say_verde("Ma dezamagesti, hai pleaca de aici.")
                                set_state(__GIVEUP__)
                                return
                        end
                        if 3==s then
                                say_title("Capitan:")
                                say_verde("")
                                say_reward("ICIIANM")
                                say_reward("ZIVTUA")
                                say_reward("AL")
                                say_reward("TROOZNI")
                                wait()
                        end
                        say_title("Capitan:")
                        say_verde("")
                        say_verde("Deci, ai vreo idee ce inseamna?")
                        local answer=input()


                        if answer=="inamici vazuti la orizont" or answer=="INAMICI VAZUTI LA ORIZONT"  then
                                say_title("Capitan:")
                                say_verde("")
                                say_verde("Are sens! Felicitari, iti merge mintea!")
                                say_verde("")
                                say_reward("Recompensa:")
                                say_reward("11.000.000 Puncte de experienta")
                                say_reward("x2 Piatra Spiritului")
                                pc.give_exp2(11000000)
                                pc.give_item2(50513,2)
                                set_quest_state("levelup","run")
                                clear_letter()
                                set_state(__COMPLETE__)
                                return
                                elseif answer=="" then
                                        say_title("Capitan:")
                                        say_verde("")
                                        say_verde("Deci? Tot nu sti ce ar putea insemna?")
                                        local a=select("Ma gandesc...","Abandonez misiunea")
                                        if 2==a then
                                                say_title("Capitan:")
                                                say_verde("")
                                                say_verde("Foarte bine, cum doresti tu, pleaca.")
                                                set_state(__GIVEUP__)
                                                return
                                        end
                                        say_title("Capitan:")
                                        say_verde("")
                                        say_verde("Deci, ai vreo idee ce inseamna?")
                                        local answer=input()

                                        if answer=="inamici vazuti la orizont" or answer=="INAMICI VAZUTI LA ORIZONT"  then
                                                say_title("Capitan:")
                                                say_verde("")
                                                say_verde("Are sens! Felicitari, iti merge mintea!")
                                                say_verde("")
                                                say_reward("Recompensa:")
                                                say_reward("11.000.000 Puncte de experienta")
                                                say_reward("x2 Piatra Spiritului")
                                                pc.give_exp2(11000000)
                                                pc.give_item2(50513,2)
                                                set_quest_state("levelup","run")
                                                clear_letter()
                                                set_state(__COMPLETE__)
                                                return
                                        else
                                                say_title("Capitan:")
                                                say_verde("")
                                                say_verde("Mai incearca, ai raspuns gresit.")
                                                return
                                        end

                        else
                                say_title("Capitan:")
                                say_verde("")
                                say_verde("Mai incearca, ai raspuns gresit.")
                                local a=select("Mai incerc","Abandonez misiunea")
                                if 2==a then
                                        say_title("Capitan:")
                                        say_verde("")
                                        say_verde("Foarte bine, cum doresti tu, pleaca.")
                                        set_state(__GIVEUP__)
                                        return
                                end
                                say_title("Capitan:")
                                say_verde("")
                                say_verde("Deci, ai vreo idee ce inseamna?")
                                local answer=input()

                                if answer=="inamici vazuti la orizont" or answer=="INAMICI VAZUTI LA ORIZONT"  then
                                        say_title("Capitan:")
                                        say_verde("")
                                        say_verde("Are sens! Felicitari, iti merge mintea!")
                                        say_verde("")
                                        say_reward("Recompensa:")
                                        say_reward("11.000.000 Puncte de experienta")
                                        say_reward("x2 Piatra Spiritului")
                                        pc.give_exp2(11000000)
                                        pc.give_item2(50513,2)
                                        set_quest_state("levelup","run")
                                        clear_letter()
                                        set_state(__COMPLETE__)
                                        return
                                else
                                        say_title("Capitan:")
                                        say_verde("")
                                        say_verde("Mai incearca, ai raspuns gresit.")
                                        return
                                end

                        end
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