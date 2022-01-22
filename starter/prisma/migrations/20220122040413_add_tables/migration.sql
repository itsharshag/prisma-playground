-- CreateTable
CREATE TABLE `Component` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `title` VARCHAR(191) NOT NULL,
    `code` TEXT NOT NULL,
    `source` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `ComponentCategory` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `_ComponentToComponentCategory` (
    `A` BIGINT NOT NULL,
    `B` BIGINT NOT NULL,

    UNIQUE INDEX `_ComponentToComponentCategory_AB_unique`(`A`, `B`),
    INDEX `_ComponentToComponentCategory_B_index`(`B`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `_ComponentToComponentCategory` ADD FOREIGN KEY (`A`) REFERENCES `Component`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `_ComponentToComponentCategory` ADD FOREIGN KEY (`B`) REFERENCES `ComponentCategory`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;
