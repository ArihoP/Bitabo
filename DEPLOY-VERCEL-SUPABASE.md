# Move Bitabo to Vercel and Supabase

This puts Bitabo online on **Vercel** (the website) and **Supabase** (login and database). Do the parts in this order. Allow about 20 minutes.

You need: a GitHub account, and the Bitabo folder from `Documents/GitHub/Bitabo`.

---

## Part 1: Put the files on GitHub

Skip this part if your repository already has all the files.

1. Go to <https://github.com> and sign in.
2. Click **+** (top right), then **New repository**.
3. Name it `bitabo`. Choose **Public** or **Private** (both work with Vercel). Leave "Add a README" unticked. Click **Create repository**.
4. Click **uploading an existing file**.
5. Drag in **every file** from the Bitabo folder:
   `index.html`, `config.js`, `manifest.json`, `sw.js`, `supabase-setup.sql`, the four `.png` icons, `README.md`.
6. Click **Commit changes**.

---

## Part 2: Create the database on Supabase

1. Go to <https://supabase.com> and sign up (use **Continue with GitHub** to keep it simple).
2. Click **New project**.
   - Name: `bitabo`
   - Database password: make a strong one and save it somewhere safe
   - Region: pick the one closest to Uganda
   - Click **Create new project** and wait about a minute.
3. In the left menu, click **SQL Editor**, then **New query**.
4. Open `supabase-setup.sql`, copy everything, paste it into the editor, and click **Run**. You should see "Success".
5. In the left menu, click **Project Settings**, then **API**. Keep this page open. You need two things from it:
   - **Project URL**
   - **anon public** key

Never use the `service_role` key anywhere in Bitabo.

---

## Part 3: Connect Bitabo to Supabase

1. On GitHub, open your `bitabo` repository and click `config.js`.
2. Click the **pencil icon** (Edit).
3. Paste your two values between the quotes:

   ```js
   window.BITABO_CONFIG = {
     SUPABASE_URL: "https://xxxxxxxx.supabase.co",
     SUPABASE_ANON_KEY: "eyJhbGciOi..."
   };
   ```
4. Click **Commit changes**.

---

## Part 4: Put the website on Vercel

1. Go to <https://vercel.com> and click **Sign Up**, then **Continue with GitHub**. Approve the request.
2. Click **Add New**, then **Project**.
3. Find your `bitabo` repository and click **Import**. If you don't see it, click **Adjust GitHub App Permissions** and allow that repository.
4. On the settings page, leave everything as it is, except check these:
   - **Framework Preset:** Other
   - **Root Directory:** `./`
   - **Build Command:** leave empty
   - **Output Directory:** leave empty
   - **Environment Variables:** none needed (the anon key is already in `config.js` and is safe to be public)
5. Click **Deploy**. Wait about a minute.
6. Click the picture of your site, or **Continue to Dashboard**, then **Visit**. Your link looks like
   `https://bitabo-xxxx.vercel.app`
   Copy it.

---

## Part 5: Tell Supabase your Vercel link

1. Back in Supabase, click **Authentication**, then **URL Configuration**.
2. Set **Site URL** to your Vercel link (no slash at the end is fine).
3. Under **Redirect URLs**, click **Add URL** and add the same link followed by `/**`, for example
   `https://bitabo-xxxx.vercel.app/**`
4. Click **Save**.
5. Click **Authentication**, then **Sign In / Providers**, and check **Email** is on.
   - To sign in straight after creating your account, switch **Confirm email** off.
   - Otherwise Supabase emails you a link to confirm first.

---

## Part 6: Test it

1. Open your Vercel link on your computer.
2. Tap **Create an account**, enter your email and a password.
3. Make a test receipt.
4. Open the same link on your phone and sign in with the same email and password. Your receipt should be there.
5. Phone home screen:
   - iPhone: open the link in Safari, tap **Share**, then **Add to Home Screen**.
   - Android: open it in Chrome, tap the three dots, then **Install app**.

---

## Part 7: Lock it down

1. In Supabase, go to **Authentication**, then **Sign In / Providers**.
2. Switch off **Allow new users to sign up**.

This stops other people creating accounts on your link. Switch it back on if you later sell Bitabo to other businesses.

---

## Updating Bitabo later

Edit a file on GitHub (pencil icon) and click **Commit changes**. Vercel redeploys by itself in about a minute. Phones that already have the app may need to close and reopen it once.

## Your own web address (optional)

In Vercel, open your project, then **Settings**, then **Domains**, and add a domain you own. Vercel shows the DNS records to set at your domain provider.

## Things to know

- **Free plans:** Vercel's free "Hobby" plan is meant for personal, non-commercial use. If Bitabo becomes a paid product, check Vercel's terms, or host the same files on Cloudflare Pages, Netlify or GitHub Pages instead. The steps for Supabase stay the same.
- **Supabase free projects pause** after about a week with no use. Open the Supabase dashboard and click **Restore**. Your data is kept.
- **Back up your data:** in Supabase, open **Table Editor**, then the `records` table, and use the export option now and then.
- **Old data on a device:** the first time you sign in on a device that already has documents, they are copied to your account.
- **If the sign-in screen does not appear:** `config.js` is still empty, or the values have a typo or a missing quote. Open `config.js` and check.
- **If sign-in works but nothing saves:** the SQL in Part 2 did not run. Run `supabase-setup.sql` again.
