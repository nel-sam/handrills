# Room 2.2.5 creates WorkManager's database reflectively; retain its constructor.
-keep class androidx.work.impl.WorkDatabase_Impl {
    public <init>();
}
