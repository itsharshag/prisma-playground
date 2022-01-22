import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();

// A `main` function so that you can use async/await
async function main() {
  const components = await prisma.component.createMany({
    data: [
      {
        id: 1,
        title: "Blog",
        code: "<h1>Hello World</h1>",
        source: "https://google.com",
      },
      {
        id: 2,
        title: "Blog 2",
        code: "<h1>Hello World</h1>",
        source: "https://google.com",
      },
    ],
  });

  const category = await prisma.componentCategory.createMany({
    data: [
      {
        id: 1,
        name: "Blog",
      },
    ],
  });

  await prisma.component.update({
    where: { id: 1 },
    data: {
      categories: { set: { id: 1 } },
    },
  });
  await prisma.component.update({
    where: { id: 2 },
    data: {
      categories: { set: { id: 1 } },
    },
  });
}

main()
  .catch((e) => {
    throw e;
  })
  .finally(async () => {
    await prisma.$disconnect();
  });
