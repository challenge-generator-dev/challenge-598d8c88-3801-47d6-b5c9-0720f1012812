# Aprovisionamiento de infraestructura de servicio de notificaciones con Terraform

El objetivo es aprovisionar la red y el computo del servicio de notificaciones utilizando Terraform. La infraestructura debe ser versionada para asegurar la reproducibilidad y el control de cambios. El servicio de notificaciones se integra con otros componentes del sistema, requiriendo una configuración adecuada de la red y los recursos de computo.

## Informacion General

| Campo | Valor |
|-------|-------|
| **Tema** | Infraestructura como codigo con Terraform |
| **Nivel** | advanced-l2 |
| **Tipo** | practical |
| **Tiempo estimado** | 8 horas |

## Fases del Reto

### Fase 0: Configuración del Proyecto

**Objetivo:** Obtener el proyecto base funcional enviando el Código Base a un asistente de IA, que lo analizará, corregirá errores y entregará cada archivo con su ruta.

**Tiempo estimado:** 15-30 minutos

**Instrucciones:**

- Asegúrate de tener instalado para ejecutar el proyecto: Go 1.21+, VS Code o GoLand.
- Copia todo el contenido del campo **Código Base** de este reto — incluyendo el texto de instrucciones que aparece al inicio.
- Abre un asistente de IA (Claude en claude.ai, ChatGPT o Gemini — se recomienda Claude), pega el contenido copiado en el chat y envíalo.
- El asistente analizará los archivos, corregirá errores y entregará cada archivo con su ruta. Guárdalos en la carpeta donde quieras trabajar, respetando las rutas.
- Ejecuta `go build ./...`. Si no hay errores, estás listo.

**Entregable:** El proyecto compila/arranca sin errores.

<details>
<summary>Pistas de conocimiento</summary>

- Copia el Código Base completo incluyendo el texto de instrucciones al inicio — esas instrucciones le indican al asistente exactamente qué hacer con los archivos.
- Si el asistente no entrega todos los archivos al terminar el análisis, escríbele: "entrégame todos los archivos con su ruta".
- Si el proyecto tiene errores al arrancar, comparte el mensaje de error con el mismo asistente para que lo corrija.

</details>

### Fase 1: Configuración inicial de Terraform

**Objetivo:** Configurar el entorno de Terraform para el aprovisionamiento de la infraestructura.

**Tiempo estimado:** 2 horas

**Instrucciones:**

- Identificar los componentes de la infraestructura necesarios para el servicio de notificaciones.
- Configurar el provider de Terraform para interactuar con el entorno de despliegue.
- Definir los recursos básicos de red y computo necesarios.

**Entregable:** Configuración de Terraform lista para el aprovisionamiento de la infraestructura.

<details>
<summary>Pistas de conocimiento</summary>

- Recuerda revisar la documentación de Terraform para asegurarte de que todos los recursos están correctamente definidos.
- Utiliza el comando `terraform init` para inicializar el entorno de trabajo.

</details>

### Fase 2: Aprovisionamiento de la red

**Objetivo:** Aprovisionar la red necesaria para el servicio de notificaciones.

**Tiempo estimado:** 3 horas

**Instrucciones:**

- Crear los recursos de red necesarios, como VPCs, subredes y grupos de seguridad.
- Asegurar que la configuración de red permita la comunicación necesaria entre el servicio de notificaciones y otros componentes del sistema.
- Verificar que la red esté correctamente aprovisionada y funcional.

**Entregable:** Red aprovisionada y funcional para el servicio de notificaciones.

<details>
<summary>Pistas de conocimiento</summary>

- Revisa la documentación de tu proveedor de cloud para asegurarte de que los recursos de red están correctamente configurados.
- Utiliza el comando `terraform apply` para aprovisionar los recursos definidos.

</details>

### Fase 3: Aprovisionamiento del computo

**Objetivo:** Aprovisionar los recursos de computo necesarios para el servicio de notificaciones.

**Tiempo estimado:** 3 horas

**Instrucciones:**

- Crear los recursos de computo necesarios, como instancias de EC2 o contenedores.
- Asegurar que los recursos de computo estén configurados para ejecutar el servicio de notificaciones.
- Verificar que los recursos de computo estén correctamente aprovisionados y funcionales.

**Entregable:** Recursos de computo aprovisionados y funcionales para el servicio de notificaciones.

<details>
<summary>Pistas de conocimiento</summary>

- Revisa la documentación de tu proveedor de cloud para asegurarte de que los recursos de computo están correctamente configurados.
- Utiliza el comando `terraform apply` para aprovisionar los recursos definidos.

</details>

## Dimensiones Evaluadas

- **queEs**: ¿Qué es Terraform y para qué se utiliza en este contexto?
- **paraQueSirve**: ¿Para qué sirve aprovisionar la red y el computo con Terraform en el servicio de notificaciones?
- **comoSeUsa**: ¿Cómo se usa Terraform para aprovisionar la infraestructura del servicio de notificaciones?
- **erroresComunes**: ¿Cuáles son los errores comunes al aprovisionar la infraestructura con Terraform y cómo se pueden evitar?
- **queDecisionesImplica**: ¿Qué decisiones implica el aprovisionamiento de la infraestructura con Terraform en términos de red y computo?

## Criterios de Evaluacion

- Configuración inicial de Terraform correctamente realizada.
- Red aprovisionada y funcional para el servicio de notificaciones.
- Recursos de computo aprovisionados y funcionales para el servicio de notificaciones.
- Identificación y resolución de errores comunes durante el aprovisionamiento.
- Decisiones informadas sobre el aprovisionamiento de la infraestructura con Terraform.

## Como trabajar con un asistente de IA

Hay dos caminos, elegi uno:

- **AGENTS.md** (recomendado) — instrucciones nativas del repo. Abri esta carpeta con tu agente local (Claude Code, Cursor, Codex, Copilot, Gemini) y las carga solo. Sabe que archivos faltan y con que comando se verifica, y completa el scaffold escribiendo en disco.
- **PROMPT_MEJORA.md** — para copiar y pegar en un chat (claude.ai, ChatGPT) si no tenes un agente en el IDE. Declara lo mismo que AGENTS.md; los archivos que te devuelva el chat los guardas en esta carpeta respetando las rutas.

Ninguno de los dos resuelve las fases del reto: eso es tu trabajo.

## Herramientas

- **Terraform**: Herramienta de trabajo del candidato: usala en la fase donde se depura o se prueba la solucion (no es una dependencia del proyecto).

## Verificacion

El proyecto esta listo para trabajar cuando este comando corre sin errores:

```bash
docker build -t reto:local . && terraform init -backend=false && terraform validate
```

---

*Reto generado automaticamente por Challenge Generator - Pragma*
