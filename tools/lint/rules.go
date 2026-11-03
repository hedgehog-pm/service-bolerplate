//go:build ruleguard

package gorules

import "github.com/quasilyte/go-ruleguard/dsl"

func generatedLocation(m dsl.Matcher) {
	m.MatchComment(`^// Code generated .* DO NOT EDIT\.$`).
		Report("Сгенерированный Go-код должен находиться в internal/generated.")
}
