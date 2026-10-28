# Compilação da monografia em PDF

Como gerar e abrir o `monografia.pdf` na máquina local (Windows).

## Pré-requisitos

- [MiKTeX](https://miktex.org/): distribuição LaTeX, que fornece `pdflatex`, `bibtex` e `latexmk`.
- [Strawberry Perl](https://strawberryperl.com/): necessário para o `latexmk` funcionar.

Se o editor ou o terminal foi aberto antes da instalação, reinicie-o para que os programas entrem no `PATH`.

## Antes de compilar

**Feche o `monografia.pdf`** se ele estiver aberto em algum leitor. O Windows bloqueia o arquivo aberto e a compilação falha com:

```
I can't write on file `monografia.pdf'.
```

## Compilar e abrir

No terminal do VS Code (PowerShell), na pasta do projeto:

```powershell
latexmk -pdf monografia.tex; if ($?) { Invoke-Item monografia.pdf }
```

O `latexmk` executa o `pdflatex`, o `bibtex` e as passadas extras necessárias para resolver referências e citações. A opção `-pdf` garante que seja usado o `pdflatex`, e não o `latex` comum, que não aceita imagens PNG.

## Alternativa sem o latexmk

Se o `latexmk` não funcionar, a mesma compilação pode ser feita manualmente:

```powershell
pdflatex -interaction=nonstopmode monografia.tex; bibtex monografia; pdflatex -interaction=nonstopmode monografia.tex; pdflatex -interaction=nonstopmode -synctex=1 monografia.tex; Invoke-Item monografia.pdf
```

Para alterações apenas de texto, sem mexer em referências ou citações, uma passada basta:

```powershell
pdflatex -interaction=nonstopmode monografia.tex; Invoke-Item monografia.pdf
```

## Problemas comuns

### A compilação parou em um prompt `?`

Exemplo:

```
! LaTeX Error: Cannot determine size of graphic in figuras/viewer.png (no BoundingBox).
?
```

Isso indica que foi usado o `latex` comum em vez do `pdflatex`. Para resolver:

1. Digite `X` e pressione Enter para sair do prompt.
2. Limpe os arquivos auxiliares, que ficam corrompidos quando a compilação é interrompida:
   ```powershell
   latexmk -c
   ```
3. Compile novamente com `latexmk -pdf monografia.tex`.

### O latexmk diz "gave an error in previous invocation"

O `latexmk` guarda o resultado da compilação anterior e não tenta de novo enquanto nada mudar. Limpe os arquivos auxiliares com `latexmk -c` e compile novamente.

### Citações ou referências aparecem como `??` no PDF

O BibTeX não foi executado depois da alteração. Compile com `latexmk -pdf monografia.tex` ou use a sequência manual completa acima.

<!-- 1024 × 640 -->

<!-- Owner https://excalidraw.com/#json=4QSsiWj6YhGr5VoOFNs1V,EjxswZkUFHg9A2g9XntIOw -->
<!-- Editor https://excalidraw.com/#json=vpDsVhuufUh1xut1jUWfm,LWblOOztfl4Bw4qZTetTzg -->
<!-- Viewer https://excalidraw.com/#json=3hPCWIRcAVBBXBanascky,2XErJH4B4bmNwDk8wUHDSQ -->