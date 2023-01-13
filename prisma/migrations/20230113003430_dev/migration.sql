-- CreateTable
CREATE TABLE "default_survey_skills" (
    "survey_group_id" UUID NOT NULL,
    "skill_id" UUID NOT NULL
);

-- CreateTable
CREATE TABLE "employee_assignments" (
    "id" UUID NOT NULL,
    "billable_role" VARCHAR(255),
    "end_date" DATE,
    "start_date" DATE,
    "employee_id" VARCHAR(255) NOT NULL,
    "survey_group_id" UUID NOT NULL,

    CONSTRAINT "employee_assignments_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "employees" (
    "id" VARCHAR(255) NOT NULL,
    "email" VARCHAR(255),
    "name" VARCHAR(255),
    "role" VARCHAR(255),
    "terms_version_number" DECIMAL(4,2),
    "date_terms_accepted" DATE,

    CONSTRAINT "employees_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "skill_rating" (
    "id" UUID NOT NULL,
    "rating" INTEGER,
    "skill_id" UUID NOT NULL,
    "survey_submission_id" UUID NOT NULL,

    CONSTRAINT "skill_rating_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "skills" (
    "id" UUID NOT NULL,
    "active" BOOLEAN,
    "category" VARCHAR(255),
    "description" VARCHAR(512),
    "skill" VARCHAR(255),
    "skills_base_id" INTEGER NOT NULL,

    CONSTRAINT "skills_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "survey_groups" (
    "id" UUID NOT NULL,
    "created_date" TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP,
    "opportunity_id" VARCHAR(255) NOT NULL,
    "project_creator_id" VARCHAR(255) NOT NULL,
    "project_name" VARCHAR(255) NOT NULL,
    "tsm_id" VARCHAR(255) NOT NULL,
    "disabled" BOOLEAN NOT NULL,
    "created_by" VARCHAR(255),
    "modified_by" VARCHAR(255),
    "modified_date" TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP,
    "project_code" VARCHAR(255) NOT NULL,

    CONSTRAINT "survey_groups_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "survey_submissions" (
    "id" UUID NOT NULL,
    "feedback" VARCHAR(255),
    "submission_date" DATE,
    "submission_status" INTEGER,
    "survey_author_id" VARCHAR(255),
    "survey_group_id" UUID,
    "survey_subject_id" UUID,
    "disabled" BOOLEAN NOT NULL,
    "creation_date" TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP,
    "last_reminder_date" TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP,
    "reminder_count" INTEGER,

    CONSTRAINT "survey_submissions_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "usage_agreement_terms" (
    "version" DECIMAL(4,2) NOT NULL,
    "text" TEXT NOT NULL,
    "start_date" DATE NOT NULL,
    "end_date" DATE,

    CONSTRAINT "usage_agreement_terms_version_pkey" PRIMARY KEY ("version")
);

-- CreateIndex
CREATE UNIQUE INDEX "uk9vfkmk3nv69wrnmj49vvpphhm" ON "default_survey_skills"("survey_group_id", "skill_id");

-- CreateIndex
CREATE UNIQUE INDEX "ukidbrpb9yo0fa3w90wb4kthwvk" ON "employee_assignments"("employee_id", "survey_group_id");

-- CreateIndex
CREATE UNIQUE INDEX "ukj9xgmd0ya5jmus09o0b8pqrpb" ON "employees"("email");

-- CreateIndex
CREATE UNIQUE INDEX "ukidbrpb9yo0fa3w80wb4kthwvk" ON "skill_rating"("skill_id", "survey_submission_id");

-- CreateIndex
CREATE UNIQUE INDEX "skills_base_id_unique_constraint" ON "skills"("skills_base_id");

-- CreateIndex
CREATE UNIQUE INDEX "survey_groups_unique_constraint" ON "survey_groups"("opportunity_id", "project_code");

-- CreateIndex
CREATE UNIQUE INDEX "ukp517gi8y7vshq51ucaejgrqwc" ON "survey_submissions"("survey_group_id", "survey_author_id", "survey_subject_id");

-- AddForeignKey
ALTER TABLE "default_survey_skills" ADD CONSTRAINT "fk1v9ku87x48swjjsydfdpuo1co" FOREIGN KEY ("skill_id") REFERENCES "skills"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "default_survey_skills" ADD CONSTRAINT "fkkm8ocly5ugg2wfajrqmiel672" FOREIGN KEY ("survey_group_id") REFERENCES "survey_groups"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "employee_assignments" ADD CONSTRAINT "fkb5n884mlrjbb855jhbxeiw08x" FOREIGN KEY ("survey_group_id") REFERENCES "survey_groups"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "employee_assignments" ADD CONSTRAINT "fkro2njbwlfgvoqd84sghx2pl9b" FOREIGN KEY ("employee_id") REFERENCES "employees"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "employees" ADD CONSTRAINT "employees_terms_version_number_fkey" FOREIGN KEY ("terms_version_number") REFERENCES "usage_agreement_terms"("version") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "skill_rating" ADD CONSTRAINT "fkfurcx3am82bjp4dvq0lx4t5d6" FOREIGN KEY ("skill_id") REFERENCES "skills"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "skill_rating" ADD CONSTRAINT "fkm2rdu3tcdphx53b373pcglc3t" FOREIGN KEY ("survey_submission_id") REFERENCES "survey_submissions"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "survey_submissions" ADD CONSTRAINT "fkddsokyu6s43in6k01o4f3aw7l" FOREIGN KEY ("survey_author_id") REFERENCES "employees"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "survey_submissions" ADD CONSTRAINT "fkmrkf9r83317f2tfbmicvbsfqp" FOREIGN KEY ("survey_group_id") REFERENCES "survey_groups"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "survey_submissions" ADD CONSTRAINT "fkrnf3peoqtqbrcdafxe20j9br2" FOREIGN KEY ("survey_subject_id") REFERENCES "employee_assignments"("id") ON DELETE CASCADE ON UPDATE NO ACTION;
