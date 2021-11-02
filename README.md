# Full-Stack Take-Home Challenge

![peek-graphql-ember](https://gist.github.com/MartinBeuriot/6e208cd6645066547de9c7b96b9fad86/raw/fb812b50edc8b4d6a8644b1956239672a373175a/fs-challenge.png)

At Peek, we build software for tour and activity operators to run their businesses. One essential feature to almost all of our operators on PeekPro is the back office calendar where they can go to schedule activities, view rental bookings and see how many of their guests are arriving in a given day, week, or month.

On our frontend team, we love EmberJs. On the backend we love Elixir, we are also big fans of GraphQL. We like the benefits it provides over a classical REST API, including the strong typing, the flexibility for the client to request exactly what they need, and the automatic documentation.

You can learn more about GraphQL, Ember and elixir from the official getting started guide at
[graphql.org/learn](https://graphql.org/learn/)
[emberjs.com/guides](https://guides.emberjs.com/release/)
[elixir-lang.org](https://elixir-lang.org/)

For this challenge, we would like for you to add two small features to an app we
have prepared for you. Whether you are new to Ember/Elixir or an expert, we hope
you'll enjoy jumping right in without having to deal with the scaffolding of the
new apps. The domain and challenges are similar to the types of problems we have had to solve here at Peek, and we believe working on this challenge will give insight into the types of technical tasks you might face as a full-stack developer here.

## Expected Time & Effort

We don't want you to have to take too much time with this challenge and ask that you do not spend more than 4 hours.

## The Sample Project

The sample project you will build upon has both an Ember app and an Elixir app.

The Ember app has

- a GraphQL call wired up hitting the provided elixir app retrieving a bunch of
  "events"
- a route already setup to display events

The Elixir app has

- an Event + Booking schema defined
- a seed script you can run to populate some sample events
- a GraphQL query to list events
- a test written to show the query returns results
- a context function written `create_booking` that will add a booking to a given event id.

## Problem Description

- In the ember app, display the events in a one day calendar view in a way that looks like a day of google calendar.
- Add the ability to add a "booking" to an event. This will require writing a new Mutation in Elixir that wires up the `create_booking` context function created for you.

### Extras

At a minimum, we ask the above be implemented. Extra points for the following:

- Filters when retrieving events
- UI for multiple days
- Querying bookings and displaying them
- [Anything else you think would make for a cool experience]

## You can use this stack for your implementation

The client folder is setup to use **Emberjs** and **apollo-ember-client** library for graphql.
The server app is setup to use **Elixir** with Phoenix framework and Absinthe for graphql.
We at peek use postgreSQL and is included in the docker-compose if you want to use it

### Server Setup

With docker, You can run the server by running:
(create, migrate, seeding in done in entrypoint.sh)

```sh
cd server
docker-compose build
docker-compose up
```

To make changes to the server, it is easier to run it locally. You will need to have hex/postgres/phoenix installed to run the following commands.
To start your Local Phoenix server:

- Install dependencies with `mix deps.get`
- Compile the project and its dependencies with `mix compile`
- Create and migrate your database with `mix ecto.setup` (alternatively you can also run `mix ecto.create` `mix ecto.migrate` and seeds events with `mix run priv/repo/seeds.exs`)
- Start Phoenix endpoint with `mix phx.server`

The app is expecting PGHOST to be set in an system var or defaults to localhost. Depending of your config you might need to export PGHOST or update some values. You can find the config used here: `server/config/config.exs`

When this is running you should be able to go to: http://localhost:4000/graphiql and try to query a list of events
Gql main endpoint is available at: http://localhost:4000/api/
CORS is enabled for http://localhost:4200/ (ember default url). If needed you can update CORS in `server/lib/peek_web/router.ex`

### Client

You will need the following things properly installed on your computer.

- [Node.js](https://nodejs.org/)
- [Yarn](https://yarnpkg.com/)
- [Ember CLI](https://ember-cli.com/)
- [Google Chrome](https://google.com/chrome/)

**Local Installation:**

- `cd client`
- `yarn`
- `npm install -g ember`

**Running / Development**

- `ember serve`
- Visit your app at [http://localhost:4200](http://localhost:4200).
- Visit your tests at [http://localhost:4200/tests](http://localhost:4200/tests).

**Code Generators**
Make use of the many generators for code, try `ember help generate` for more details

## Learn more

Learn more about Phoenix/Elixir:

- Official website: https://www.phoenixframework.org/
- Guides: https://hexdocs.pm/phoenix/overview.html
- Docs: https://hexdocs.pm/phoenix
- Forum: https://elixirforum.com/c/phoenix-forum
- Source: https://github.com/phoenixframework/phoenix

Learn more about Ember:

- [ember.js](https://emberjs.com/)
- [ember-cli](https://ember-cli.com/)

Learn more about some tools:

- [Insomnia](https://insomnia.rest/graphql/) - a desktop API testing application with good GraphQL support.
- [Git](https://git-scm.com/)
- [Node.js](https://nodejs.org/)
- [Yarn](https://yarnpkg.com/)
- [Ember CLI](https://ember-cli.com/)
- [Docker](https://docker.com/)
- [ember inspector for chrome](https://chrome.google.com/webstore/detail/ember-inspector/bmdblncegkenkacieihfhpjfppoconhi)
- [ember inspector for firefox](https://addons.mozilla.org/en-US/firefox/addon/ember-inspector/)


## Question?

If you have any questions, do not hesitate at all to ask (martin@peek.com).
