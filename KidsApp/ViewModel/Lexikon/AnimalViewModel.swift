//
//  AnimalViewModel.swift
//  Kidsapp
//
//  Created by Jacqueline Kolbe on 28.08.24.
//

import Foundation

class AnimalViewModel: ObservableObject {
    @Published var animals: [Animal] = []

    init() {
        loadAnimals()
    }

    private func loadAnimals() {
        // Tiere hinzugefügen
        animals = [
            Animal(name: "ALPAKA", description: "Alpakas sind die etwas kleineren Verwandten der Lamas. Sie sind vor allem für ihre sehr feine, warme Wolle berühmt.", imageName: "alpaka"),
            Animal(name: "BIBER", description: "Biber sind richtige Landschafts-Architekten: Sie bauen Burgen und Dämme, stauen Bäche auf und fällen Bäume. Dadurch schaffen sie neuen Lebensraum für Pflanzen und Tiere.", imageName: "bieber"),
            Animal(name: "BRAUNBÄR", description: "Braunbären sind zwar hübsch anzusehen, aber wenn man ihnen zu nahe kommt, kann das richtig gefährlich werden.", imageName: "braunbär"),
            Animal(name: "CHINCHILLA", description: "Chinchillas sind sehr neugierige, unternehmungslustige Tiere, aber am Tag brauchen sie ihren Schlaf.", imageName: "chinchills"),
            Animal(name: "DACHS", description: "Der Dachs ist ein scheues Tier – deshalb bekommt man ihn nur selten zu sehen.In der Fabel wird der Dachs auch als Grimbart bezeichnet.", imageName: "dachs"),
            Animal(name: "DAMWILD", description: "Auf den ersten Blick erinnert Damwild an Rehe oder Hirsche. Doch zum Glück haben sie ein Merkmal, das sie unverwechselbar macht: ihr weiß gepunktetes Fell.", imageName: "damwild"),
            Animal(name: "DELFIN", description: "Delfine haben die Menschen schon immer fasziniert: In der Antike galten die intelligenten Meeressäuger sogar als heilig.", imageName: "delfin"),
            Animal(name: "EICHHÖRNCHEN", description: "Ihr Name kommt entweder vom indogermanischen Wort aig – etwas, das sich schnell bewegt; oder von aik – Eiche. Und die puscheligen Ohren sehen von weitem aus wie kleine Hörnchen.", imageName: "eichhörnchen"),
            Animal(name: "EISBÄR", description: "Spätestens seit der Eisbär Knut berühmt wurde, stehen Eisbären auf der Sympathieskala der Menschen ganz oben. Doch in ihrem natürlichen Lebensraum sind die Raubtiere bedroht.", imageName: "eisbär"),
            Animal(name: "ELEFANT", description: "Elefanten sind die größten Landsäugetiere. Die Dickhäuter faszinieren Menschen seit Jahrtausenden mit ihrer Intelligenz und ihrem sensiblen Wesen.", imageName: "elefant"),
            Animal(name: "ERDMÄNNCHEN", description: "Sie sind prima Teamworker: Ob Wache schieben oder auf die Jungen aufpassen – dank der Arbeitsteilung meistern Erdmännchen das Leben in den Savannen im Süden Afrikas perfekt.", imageName: "ERDMÄNNCHEN"),
            Animal(name: "ESEL", description: "Esel wird auch als Schimpfwort benutzt im Sinne von Dummkopf. Eine Eselsbrücke ist ein Satz oder Wort, das helfen soll, sich etwas zu merken oder zu verstehen.", imageName: "ESEL"),
            Animal(name: "FAULTIER", description: "Bei Faultieren steht die Welt meist auf dem Kopf: Sie hängen mit Kopf und Rücken nach unten im Baum und bewegen sich nur im Zeitlupentempo.", imageName: "FAULTIER"),
            Animal(name: "HASE", description: "Feldhasen sind scheu, schnell und dank ihrer langen Ohren wirklich unverkennbar. Außerdem haben sie als Osterhase Karriere gemacht.", imageName: "HASE"),
            Animal(name: "FISCHOTTER", description: "Der Name Otter stammt vom indogermanischen Wort udros ab.Ins Deutsche übersetzt bedeutet das Wassertier.", imageName: "FISCHOTTER"),
            Animal(name: "FLEDERMAUS", description: "Fledermäuse sind die einzigen Säugetiere, die aktiv fliegen können. Sie fliegen lautlos durch die Nacht, doch die wenigsten von ihnen sind blutleckende Vampire.", imageName: "FLEDERMAUS"),
            Animal(name: "FRETTCHEN", description: "Der lateinische Name kommt von mus = Maus und putorius = übel riechen, weil Frettchen Mäuse jagen und eine Stinkdrüse zur Abwehr ihrer Feinde besitzen.", imageName: "FRETTCHEN"),
            Animal(name: "FUCHS", description: "Der Fuchs gilt als besonders schlau. Deshalb wird er auch Reineke oder Reinhard genannt - das bedeutet der durch seine Schlauheit Unüberwindliche.", imageName: "FUCHS"),
            Animal(name: "GAZELLE", description: "Typisch für Gazellen sind ihre eleganten Bewegungen und Sprünge. Die zierlichen Paarhufer sind vor allem in den Steppen und Savannen Afrikas und Asiens zuhause.", imageName: "GAZELLE"),
            Animal(name: "GEPARD", description: "Sie sind die Ferraris unter den auf dem Land lebenden Säugetieren: Die grazilen Geparden erreichen bei der Jagd Spitzengeschwindigkeiten von mehr als 100 Kilometer pro Stunde.", imageName: "GEPARD"),
            Animal(name: "GIRAFFE", description: "Giraffen gehören zu den auffälligsten Tieren: Mit ihrem extrem langen Hals sind sie unverwechselbar.", imageName: "GIRAFFE"),
            Animal(name: "GORILLA", description: "Affen sind uns Menschen von allen Tiere am ähnlichsten, besonders die Familie der Menschenaffen. Dazu zählen auch die Gorillas aus dem tropischen Afrika.", imageName: "GORILLA"),
            Animal(name: "HAUSMAUS", description: "Niedlich oder eklig? Bei der Hausmaus scheiden sich die Geister: Die einen finden das kleine Nagetier süß, für die anderen ist es ein Schädling.", imageName: "HAUSMAUS"),
            Animal(name: "HUND", description: "Für viele ist er der beste Freund: Hunde leben seit Jahrtausenden bei den Menschen. Hunde sind nicht nur treue Gefährten, sondern auch Wach-, Hüte- und Suchhunde.", imageName: "HUND"),
            Animal(name: "HUSKY", description: "Huskys brauchen viel soziale Kontakte und Zuneigung. Wenn sie als Schlittenhunde gehalten werden, leben sie meist im Rudel.", imageName: "HUSKY"),
            Animal(name: "IGEL", description: "Der Igel erhielt seinen Namen wegen einer seiner Lieblingsspeisen, denn Igel bedeutet der zur Schlange gehörende oder auch Schlangenfresser.", imageName: "IGEL"),
            Animal(name: "ISLANDPONY", description: "Islandpferde, auch Isländer oder Islandpony genannt, sehen ziemlich gemütlich aus. Sie sind etwas mollig und haben kräftige Hinterbeine.", imageName: "ISLANDPONY"),
            Animal(name: "KAMEL", description: "Kamele sind perfekt an ein Leben in der Wüste angepasst. Zu ihnen zählen die einhöckrigen Dromedare aus Nordafrika und Arabien, sowie die zweihöckrigen Trampeltiere aus Asien.", imageName: "KAMEL"),
            Animal(name: "KÄNGURU", description: "Das Wort Känguru kommt aus der Sprache der Aborigines, der australischen Ur-Einwohner. Der Seefahrer James Cook war der erste Europäer, die von den Kängurus berichtete.", imageName: "KÄNGURU"),
            Animal(name: "KATTA", description: "Kattas sind schlau: Die pelzigen Gesellen mit dem lustig geringelten Schwanz haben sich perfekt an die Lebensbedingungen in ihrer Heimat Madagaskar angepasst.", imageName: "KATTA"),
            Animal(name: "KATZE", description: "Katzen sind sehr beliebte, aber auch eigenwillige Haustiere: Manchmal sind sie unnahbar und kratzbürstig, dann wieder verschmust und verspielt.", imageName: "KATZE"),
            Animal(name: "KOALA", description: "Koalas gelten als Vorbilder für die Teddybären. Die stillen Beuteltiere verbringen ihr Leben hoch oben in Eukalyptus-Bäumen.", imageName: "KOALA"),
            Animal(name: "KUH", description: "Rinder gehören zu den wichtigsten Nutztieren des Menschen: Von ihnen bekommen wir Milch und Fleisch.", imageName: "KUH"),
            Animal(name: "LAMA", description: "Anmutig und leichtfüßig ziehen die Lamas über die steilen Pässe der Anden. Diese Kamele der neuen Welt sind wichtige Tragtiere sowie Woll- und Fleischlieferanten.", imageName: "LAMA"),
            Animal(name: "LEOPARD", description: "Der Leopard ist ein richtiges Kraftpaket: Er kann sehr gut klettern und springen und schwere Beute hoch oben auf Bäumen verstecken.", imageName: "LEOPARD"),
            Animal(name: "LÖWE", description: "Löwen gelten als die Könige der Tiere und haben Menschen von jeher fasziniert. Vor allem männliche Löwen beeindrucken mit ihrer großen Mähne und ihrem gewaltigen Gebrüll.", imageName: "LÖWE"),
            Animal(name: "MEERSCHWEINCHEN", description: "Seinen Namen trägt das Meerschweinchen, weil es Geräusche wie ein junges Schwein macht und weil es von Südamerika aus über das Meer nach Europa gebracht worden ist.", imageName: "MEERSCHWEINCHEN"),
            Animal(name: "MINI-SCHWEIN", description: "Sie sind schlau und ziemlich eigensinnig: Mini-Schweine sind bei manchen Menschen beliebter als Hunde oder Katzen.", imageName: "MINI-SCHWEIN"),
            Animal(name: "NASENBÄR", description: "Ihren Namen tragen sie nicht von ungefähr: Nasenbären besitzen eine Nase, die wie ein kleiner Rüssel verlängert und sehr beweglich ist.", imageName: "NASENBÄR"),
            Animal(name: "NASHORN", description: "Weil die Oberlippe eines Spitzmaulnashorns spitz wie ein Finger geformt ist und sogar greifen kann, haben die grauen Riesen ihren Namen.", imageName: "NASHORN"),
            Animal(name: "PANDA", description: "Obwohl sie mächtige Bären sind, sehen sie zum Knuddeln aus: Mit ihren aufgesetzten Ohren, dem dicken Fell und der pummeligen Gestalt erinnern Pandabären an riesige Teddys.", imageName: "PANDA"),
            Animal(name: "PAVIAN", description: "Eine mächtige, fast wie bei einem Hund nach vorn stehende Schnauze, große Eckzähne, ein dickes Fell und eine kräftige Gestalt sind die Kennzeichen der Paviane.", imageName: "PAVIAN"),
            Animal(name: "PFERD", description: "Pferde sind nicht nur edle und schöne Tiere, sondern seit Jahrtausenden wichtige Helfer: Sie tragen Menschen über weite Strecken und transportieren auch schwere Lasten.", imageName: "PFERD"),
            Animal(name: "PRÄRIEHUND", description: "Mit Hunden haben Präriehunde nichts zu tun - sie sind Nagetiere und keine Raubtiere. Aber weil sie bellen können, wurden sie von kanadischen Trappern Präriehunde genannt.", imageName: "PRÄRIEHUND"),
            Animal(name: "RENTIER", description: "Rentiere haben eine Besonderheit: Bei diesen Hirschen aus den nördlichsten Regionen der Welt tragen auch die Weibchen ein mächtiges Geweih.", imageName: "RENTIER"),
            Animal(name: "SCHAF", description: "Schafe – und vor allem die jungen Lämmchen – sind sehr friedliche Tiere. Seit vielen tausend Jahren liefern sie dem Menschen Wolle, Milch und Fleisch.", imageName: "SCHAF"),
            Animal(name: "SCHIMPANSE", description: "Diese Menschenaffen sind unsere nächsten Verwandten im Tierreich. Sie gelten als die intelligentesten Tiere und faszinieren uns so sehr, weil ihr Verhalten unserem so ähnlich ist.", imageName: "SCHIMPANSE"),
            Animal(name: "SCHNEELEOPARD", description: "Leise und fast unsichtbar streift der Schneeleopard durch die Bergwelt des Himalaya: Mit seinem grauweißen Fell und den dunklen Punkten ist er hervorragend getarnt.", imageName: "SCHNEELEOPARD"),
            Animal(name: "SEEHUND", description: "Das Lebenselement der sympathischen Seehunde ist das Wasser. Hier finden sie sich auch blind zurecht und faszinieren uns mit ihren eleganten Schwimmkünsten.", imageName: "SEEHUND"),
            Animal(name: "WASCHBÄR", description: "Der Waschbär findet seine Nahrung oft im Wasser. Wenn er sie mit seinen Pfoten hält, sieht es aus, als ob er sie wäscht. Daher kommt der Name Waschbär.", imageName: "WASCHBÄR"),

        ]
    }
}

