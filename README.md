# Amigo Secreto Sanduicheira

Site estatico (um unico `index.html`) com Supabase de banco e de fotos.

## Arquivos
- `index.html` - versao principal (fontes pixel)
- `index-peak.html` - versao com a fonte Darumadrop One (para usar, renomeie para `index.html`)
- `supabase.sql` - cria a tabela e a pasta de fotos
- `logos/` - logo em PNG (vermelho, branco, vermelho com sombra verde)

## Passo a passo
1. **Supabase**: SQL Editor > New query > cole o `supabase.sql` > Run.
2. **GitHub**: suba todos estes arquivos na raiz do repositorio.
3. **Vercel**: importe o repositorio. Framework: Other. Sem build command. Ele publica sozinho a cada push.

## Seguranca
- A chave `anon` dentro do `index.html` e publica por natureza, tudo bem ela ficar no git.
- A **secret key** (`sb_secret_...`) NUNCA vai para o codigo nem para o git. Como ela foi colada em um chat, gere uma nova em Supabase > Project Settings > API Keys.
- O sorteio e cifrado no navegador de cada pessoa (nome + PIN). Quem esquecer o PIN perde o envelope.
- Qualquer pessoa com o link pode adicionar fotos de referencia para qualquer participante.
