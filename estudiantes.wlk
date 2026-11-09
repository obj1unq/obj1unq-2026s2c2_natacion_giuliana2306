class Estudiante {
    var estilosDominados = #{}
    var edad

    method dominaAlMenosUnEstilo() {
        return !estilosDominados.isEmpty()
    }
    method esMenorDe13Años() {
        return edad < 13
    }
    method dominaAlMenosUnEstiloRelajante() {
        return estilosDominados.any({estilo => estilo.esRelajante()})
    }
    method domina(estilo) {
        return estilosDominados.contains(estilo)
    }
    method totalDeDescuentos() {
        return estilosDominados.sum({estilo => estilo.descuento()})
    }
}