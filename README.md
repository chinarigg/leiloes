# Lilie's Club · Leilões

Site estático (um único `index.html`) + Supabase (banco + login).

## 1. Supabase
1. Crie um projeto em supabase.com.
2. **SQL Editor** → cole o conteúdo de `schema.sql` → Run.
3. **Authentication → Sign In / Providers → Email**: desative **"Allow new users to sign up"** (assim só você entra).
4. **Authentication → Users → Add user → Create new user**: coloque seu e-mail e senha e marque *Auto Confirm User*.
5. **Project Settings → API**: copie a **Project URL** e a chave **anon public**.
6. No `index.html`, troque no topo do `<script>`: `SUPABASE_URL` e `SUPABASE_KEY`.
   (A chave anon pode ficar no código: quem protege os dados são as regras RLS do `schema.sql`. Nunca use a `service_role`.)

## 2. GitHub Pages
1. Crie um repositório e envie `index.html` (e `README.md`, `schema.sql` se quiser).
2. **Settings → Pages → Deploy from a branch → main / (root)**.

## 3. Subdomínio
1. No seu provedor de DNS, crie um registro **CNAME**: `leiloes` → `SEU-USUARIO.github.io`.
2. Em **Settings → Pages → Custom domain**, digite `leiloes.seudominio.com` e marque **Enforce HTTPS**.
3. No Supabase, **Authentication → URL Configuration → Site URL**: `https://leiloes.seudominio.com`.

## 4. Primeiro acesso
Entre com o e-mail/senha criados e clique em **Importar planilha** (só aparece com o estoque vazio).
