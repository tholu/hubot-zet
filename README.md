# Hubot: hubot-zet

A ZET Menu service for Hubots (http://blog.techno-z.at/).

[![Build Status](https://travis-ci.org/tholu/hubot-zet.png?branch=master)](https://travis-ci.org/tholu/hubot-zet)

See [`src/zet.coffee`](src/zet.coffee) for full documentation.

## Installation

Add **hubot-zet** to your `package.json` file:

```json
"dependencies": {
  "hubot": ">= 2.5.1",
  "hubot-scripts": ">= 2.4.2",
  "hubot-zet": ">= 0.0.0"
}
```

Add **hubot-zet** to your `external-scripts.json`:

```json
["hubot-zet"]
```

Run `npm install hubot-zet`

Add **hubot-zet** to your `external-scripts.json`:

```json
["hubot-zet"]
```

## Sample Interaction

```
user1>> hubot zet
hubot>> 03.12. - Rindsuppe mit Einlage oder eine gebundene Suppe - Gerollte Kalbsbrust mit Gemüsereis €6,80 - Majoranfleisch mit Butternockerln €6,30  - Vegetarische Kartoffel-Pizza €5,70
```
