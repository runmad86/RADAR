import Foundation

enum RadarMockData {
    static let listItems: [RadarListItem] = [
        makeOpenItem(),
        makeHotItem(),
        makeLockedItem(),
        makeNoneItem()
    ]

    private static func makeOpenItem() -> RadarListItem {
        let detail = RadarMatchDetail(
            id: "barca-atletico-open-demo",
            title: "Leverkusen - Stuttgart",
            competitionName: "Bundesliga",
            kickoffText: "I dag 18.30",
            profile: .open,
            strength: .strong,
            supportIcons: ["bolt", "arrow.left.and.right", "clock"],
            whyBlocks: [
                RadarWhyBlock(iconName: "bolt", title: "Maalflow lever", subtitle: "Begge hold bidrager offensivt"),
                RadarWhyBlock(iconName: "arrow.left.and.right", title: "Gensidighed", subtitle: "Det lugter mere to-vejs end en-vejs"),
                RadarWhyBlock(iconName: "clock", title: "Frisk stoette", subtitle: "Nyere moenstre peger samme vej")
            ],
            outputs: RadarOutputSection(
                baseCases: ["BTTS", "Over 2,5"],
                spikeCases: ["BTTS + Over 2,5"],
                hasNoClearCase: false
            ),
            verdict: "Aaben kamp. BTTS er mest ren. Over lever ogsaa."
        )

        return RadarListItem(
            id: detail.id,
            title: detail.title,
            competitionName: detail.competitionName,
            kickoffText: detail.kickoffText,
            profile: detail.profile,
            strength: detail.strength,
            supportIcons: detail.supportIcons,
            shortVerdict: "Aaben kamp",
            detail: detail
        )
    }

    private static func makeHotItem() -> RadarListItem {
        let detail = RadarMatchDetail(
            id: "barca-atletico-hot-demo",
            title: "Barca - Atletico",
            competitionName: "La Liga",
            kickoffText: "I dag 21.00",
            profile: .hot,
            strength: .strong,
            supportIcons: ["flame", "hand.raised", "clock"],
            whyBlocks: [
                RadarWhyBlock(iconName: "flame", title: "Hoj temperatur", subtitle: "Kort lugter mere naturligt end maal"),
                RadarWhyBlock(iconName: "hand.raised", title: "Duelkamp", subtitle: "Mange friktionspunkter i laesningen"),
                RadarWhyBlock(iconName: "clock", title: "Frisk indbyrdes stoette", subtitle: "Nyere opgoer peger samme vej")
            ],
            outputs: RadarOutputSection(
                baseCases: ["Over kort", "Begge hold kort"],
                spikeCases: ["Roedt kort"],
                hasNoClearCase: false
            ),
            verdict: "Hed kamp. Kort er base. Roedt er spids."
        )

        return RadarListItem(
            id: detail.id,
            title: detail.title,
            competitionName: detail.competitionName,
            kickoffText: detail.kickoffText,
            profile: detail.profile,
            strength: detail.strength,
            supportIcons: detail.supportIcons,
            shortVerdict: "Hed kamp",
            detail: detail
        )
    }

    private static func makeLockedItem() -> RadarListItem {
        let detail = RadarMatchDetail(
            id: "cadiz-mallorca-locked-demo",
            title: "Cadiz - Mallorca",
            competitionName: "La Liga",
            kickoffText: "I morgen 16.15",
            profile: .locked,
            strength: .moderate,
            supportIcons: ["lock", "tortoise", "clock"],
            whyBlocks: [
                RadarWhyBlock(iconName: "lock", title: "Laast grundkamp", subtitle: "Faa rum og lav aabning"),
                RadarWhyBlock(iconName: "tortoise", title: "Lav rytme", subtitle: "Under lugter mere end maal"),
                RadarWhyBlock(iconName: "clock", title: "Tynd maalstoette", subtitle: "Signalet peger ikke mod aaben kamp")
            ],
            outputs: RadarOutputSection(
                baseCases: ["Under 2,5"],
                spikeCases: ["Under 1,5"],
                hasNoClearCase: false
            ),
            verdict: "Laast grundkamp. Under 2,5 er mest naturlig."
        )

        return RadarListItem(
            id: detail.id,
            title: detail.title,
            competitionName: detail.competitionName,
            kickoffText: detail.kickoffText,
            profile: detail.profile,
            strength: detail.strength,
            supportIcons: detail.supportIcons,
            shortVerdict: "Laast kamp",
            detail: detail
        )
    }

    private static func makeNoneItem() -> RadarListItem {
        let detail = RadarMatchDetail(
            id: "liverpool-psg-none-demo",
            title: "Liverpool - PSG",
            competitionName: "Europa",
            kickoffText: "I aften 21.00",
            profile: .none,
            strength: .weak,
            supportIcons: ["questionmark.circle", "arrow.triangle.branch", "clock"],
            whyBlocks: [
                RadarWhyBlock(iconName: "questionmark.circle", title: "Stoetten er tynd", subtitle: "Ingen klar hovedlugt vinder"),
                RadarWhyBlock(iconName: "arrow.triangle.branch", title: "Blandede signaler", subtitle: "Flere veje lever lidt uden at fortjene dom"),
                RadarWhyBlock(iconName: "clock", title: "Base-case uklar", subtitle: "Ingen ren vej ud endnu")
            ],
            outputs: RadarOutputSection(
                baseCases: [],
                spikeCases: [],
                hasNoClearCase: true
            ),
            verdict: "Ingen staerk nok case endnu."
        )

        return RadarListItem(
            id: detail.id,
            title: detail.title,
            competitionName: detail.competitionName,
            kickoffText: detail.kickoffText,
            profile: detail.profile,
            strength: detail.strength,
            supportIcons: detail.supportIcons,
            shortVerdict: "Ingen klar case",
            detail: detail
        )
    }
}
