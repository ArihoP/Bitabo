# Bitabo

Make **quotes, invoices and receipts** in a few taps, with your own logo on every document.

## What it does

- Quotes, invoices and receipts, numbered automatically (QT-0001, INV-0001, RC-0001)
- **One layout for everything:** logo and business details at the top, a big title, billed-to and number/date block, an itemised table, totals, payment details, notes, terms, signature and a footer line. Quotes, invoices and receipts all use it, and the on-screen preview and the PDF are always the same
- Payment status in colour: "Paid so far" in green, "Balance due" in orange, and a PAID stamp when settled
- Your logo, business details and signature ("Authorized Sign") on every document and PDF
- **Quick receipt:** type the client, what they paid for and the amount paid today. Bitabo adds what that client already paid for the same service and shows the balance
- **Client pages:** click a client to see how much they were billed, how much they have paid and their balance, with every invoice, receipt and quote
- **Totals page:** how much money has gone through Bitabo, for this month, the last 30 days, this year, all time or dates you choose, split by payment method, client, month and service
- Invoice and receipt numbers only ever go up and are never reused, even if you delete a document
- **Clients** and **Services** pages: save them once, pick them next time. New clients and services are also saved automatically
- Turn an accepted quote into an invoice
- Record payments by issuing receipts. Invoices show Unpaid, Part paid, Paid or Overdue
- Download any document as a PDF
- Copy a plain-text version to paste into WhatsApp
- Currencies: UGX, KES, TZS, RWF, USD, EUR, GBP
- Payment methods: Mobile Money (MoMo), Cash, Bank, or Other (type your own)
- Helpful placeholders in every field

## Add your logo

1. Open Bitabo and tap **Business details**.
2. Under **Logo**, choose your image (PNG or JPG works best, a transparent PNG looks cleanest).
3. Tap **Save details**.

Your logo now shows on every quote, invoice and receipt, and in the PDFs.

## Add your payment details and footer line

In **Business details**, fill in **Payment details** (Mobile Money number and name, bank, account number, account name). They are printed as neat labelled lines on every quote and invoice. The **Footer line** (for example `PHOTOGRAPHY | VIDEOGRAPHY`) is printed as a black band at the bottom of every document.

## Change the document colour

In **Business details**, pick a **Document colour**. It colours the table header, the total bar, the line under the header and the footer band on every document and PDF. The default is the original dark look. Light blue works well too. The text on the bands switches between dark and white by itself so it stays easy to read.

## Add your signature

In **Business details**, under **Signature**, choose a PNG of your signature (a transparent background looks best) and tap **Save details**. It appears above "Authorized Sign".

## Do I need a database?

Not for a logo. The logo is saved together with your business details.

| Where the app runs | Where your documents and logo are kept | Who can see them |
| --- | --- | --- |
| Inside Claude (the published artifact) | In the app's own online database | You (and anyone you share it with) |
| This GitHub version (a static page) | In the browser on that device | Only the person on that browser |

GitHub Pages can only host files. It has no database of its own, so this version keeps everything in the browser. That is fine for one person on one computer or phone. It is **not** shared between devices.

**When you would need a real database:** when you want to log in from your phone and your laptop and see the same documents, or send a client a link to view their invoice. The usual free choice is [Supabase](https://supabase.com). That is a separate setup with its own account and keys, and it needs extra code in this app. Ask for it when you are ready.

## Make it visible to someone who is not on your computer

You will put the app on GitHub, then turn on GitHub Pages. That gives you a public web link.

### 1. Create a GitHub account

Go to <https://github.com> and sign up (free).

### 2. Create a repository

1. Click the **+** at the top right, then **New repository**.
2. Name it `bitabo`.
3. Choose **Public**. (GitHub Pages on the free plan needs a public repository.)
4. Leave **Add a README file** unticked, because this folder already has one.
5. Click **Create repository**.

### 3. Upload the files

1. On the new repository page, click **uploading an existing file**.
2. Drag **all the files** from this folder into the page (`index.html`, `config.js`, `manifest.json`, `sw.js`, `supabase-setup.sql`, the four `.png` icons and `README.md`).
3. Click **Commit changes**.

### 4. Turn on GitHub Pages

1. In the repository, click **Settings**.
2. In the left menu, click **Pages**.
3. Under **Build and deployment**, set **Source** to **Deploy from a branch**.
4. Set **Branch** to `main` and the folder to `/ (root)`. Click **Save**.
5. Wait about a minute and refresh the page. A green box appears with your link:

   `https://YOUR-USERNAME.github.io/bitabo/`

### 5. Share the link

Send that link to anyone. It opens in any browser on any phone or computer, with no sign-in.

## Add Bitabo to your phone's home screen

Once the app is live on GitHub Pages, anyone can put it on their phone like a normal app. It opens full screen, with its own icon, and works offline after the first visit.

**iPhone (Safari):**
1. Open your Bitabo link in **Safari**.
2. Tap the **Share** button (the square with an arrow).
3. Scroll down and tap **Add to Home Screen**, then **Add**.

**Android (Chrome):**
1. Open your Bitabo link in **Chrome**.
2. Tap the **three dots** at the top right.
3. Tap **Install app** (or **Add to Home screen**).

**Computer (Chrome or Edge):** click the install icon at the right end of the address bar.

Keep using the same browser for the first visit: the documents you make are stored on that device.

## Turn on login, so you see the same data on your phone and computer

Out of the box, Bitabo keeps data in one browser. To log in from any device, connect it to a free [Supabase](https://supabase.com) database. You do this once, about 10 minutes.

**What you get:** a sign-in screen, your quotes, invoices, receipts, clients, services, logo and signature saved to your account, and the same data on every device where you sign in. Each account sees only its own data.

### Steps

1. **Create a project.**
   - Go to <https://supabase.com> and sign up (free).
   - Click **New project**. Name it `bitabo`, set a database password (save it somewhere safe), and pick the region closest to you. Wait a minute while it sets up.
2. **Create the table.**
   - In the left menu, click **SQL Editor**, then **New query**.
   - Open the file `supabase-setup.sql` from this folder, copy everything in it, paste it into the editor, and click **Run**. You should see "Success".
3. **Allow sign-ups by email.**
   - Click **Authentication**, then **Sign In / Providers**, and make sure **Email** is on.
   - To sign in straight after creating your account, switch **Confirm email** off. If you leave it on, Supabase emails you a link to click first.
4. **Set your site address.**
   - Click **Authentication**, then **URL Configuration**.
   - Set **Site URL** to your GitHub Pages link, for example `https://YOUR-USERNAME.github.io/bitabo/`.
5. **Copy your two keys.**
   - Click **Project Settings**, then **API**.
   - Copy the **Project URL** and the **anon public** key.
6. **Paste them into `config.js`.**
   - On GitHub, open `config.js` in your repository and click the pencil icon.
   - Put the URL between the quotes after `SUPABASE_URL:` and the key between the quotes after `SUPABASE_ANON_KEY:`.
   - Click **Commit changes** and wait a minute.
7. **Sign in.**
   - Open your Bitabo link and tap **Create an account**.
   - Use the same email and password on your phone.
   - The first time you sign in, anything you made on that device before is added to your account.

### Good to know

- **The anon key is safe to publish.** It is designed to be public, and your data is protected by the table rules in `supabase-setup.sql`. **Never paste the `service_role` key** anywhere.
- **Stop strangers making accounts.** After you have created your own account, go to **Authentication, Sign In / Providers** and switch off **Allow new users to sign up**.
- **Free plan pauses after a week of no use.** If a project pauses, open the Supabase dashboard and click **Restore**. Your data is kept.
- **Offline:** the app opens offline and shows your last saved data, but changes need an internet connection to save to your account.
- **Forgot your password:** reset it in the Supabase dashboard under **Authentication, Users**.
- **Leave `config.js` empty** and the app works exactly as before, on one device, with no login.

## Things to know

- **The link shares the app, not your data.** Without login, data stays in each person's own browser. With login turned on, data belongs to the account that created it.
- **Use the same browser each time**, and do not clear the site's data, or the saved documents go with it.
- **Changing the app later:** open `index.html` in the repository, click the pencil icon, edit, and commit. The live page updates in a minute.
- **PDF export needs internet** because the PDF tool loads from a CDN.
- **Do not put client lists or private data in the repository.** It is public.

## Files

| File | What it is |
| --- | --- |
| `index.html` | The whole app: page, styles and code |
| `manifest.json` | Name, colours and icons, so the app can be added to a home screen |
| `sw.js` | Lets the app open offline after the first visit |
| `config.js` | Where you paste your Supabase address and key to turn on login |
| `supabase-setup.sql` | The one-time database setup you run in Supabase |
| `icon-192.png`, `icon-512.png`, `icon-maskable-512.png`, `apple-touch-icon.png` | The app icon in the sizes phones need |
| `README.md` | This guide |
